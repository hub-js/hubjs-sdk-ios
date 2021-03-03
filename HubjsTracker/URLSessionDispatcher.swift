import Foundation

public final class URLSessionDispatcher: Dispatcher {
    
    private let serializer = EventAPISerializer()
    private let timeout: TimeInterval
    private let session: URLSession
    public let baseURL: URL
    @objc public var logger: Logger = DefaultLogger(minLevel: .verbose)
    public private(set) var userAgent: String?
    
    /// Generate a URLSessionDispatcher instance
    ///
    /// - Parameters:
    ///   - baseURL: The url of the Hubjs server. This url has to end in `hubjs.php`.
    ///   - userAgent: An optional parameter for custom user agent.
    ///   - timeout: The timeout interval for the request. The default is 5.0.
    public init(baseURL: URL, userAgent: String? = nil, timeout: TimeInterval = 5.0) {
        self.baseURL = baseURL
        self.timeout = timeout
        self.session = URLSession.shared
        self.userAgent = userAgent ?? UserAgent(application: Application.makeCurrentApplication(), device: Device.makeCurrentDevice()).stringValue
    }
    
    public func logSend(request: URLRequest) {
       print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
       defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
       let urlAsString = request.url?.absoluteString ?? ""
       let urlComponents = URLComponents(string: urlAsString)
       let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
       let path = "\(urlComponents?.path ?? "")"
       let query = "\(urlComponents?.query ?? "")"
       let host = "\(urlComponents?.host ?? "")"
       var output = """
       \(urlAsString) \n\n
       \(method) \(path)?\(query) HTTP/1.1 \n
       HOST: \(host)\n
       """
       for (key,value) in request.allHTTPHeaderFields ?? [:] {
          output += "\(key): \(value) \n"
       }
       if let body = request.httpBody {
          output += "\n \(String(data: body, encoding: .utf8) ?? "")"
       }
       print(output)
    }
    
    public func logReceive(response: HTTPURLResponse?, data: Data?, error: Error?) {
       print("\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n")
       defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
       let urlString = response?.url?.absoluteString
       let components = NSURLComponents(string: urlString ?? "")
       let path = "\(components?.path ?? "")"
       let query = "\(components?.query ?? "")"
       var output = ""
       if let urlString = urlString {
          output += "\(urlString)"
          output += "\n\n"
       }
       if let statusCode =  response?.statusCode {
          output += "HTTP \(statusCode) \(path)?\(query)\n"
       }
       if let host = components?.host {
          output += "Host: \(host)\n"
       }
       for (key, value) in response?.allHeaderFields ?? [:] {
          output += "\(key): \(value)\n"
       }
       if let body = data {
          output += "\n\(String(data: body, encoding: .utf8) ?? "")\n"
       }
       if error != nil {
          output += "\nError: \(error!.localizedDescription)\n"
       }
       print(output)
    }
    
    public func send(events: [Event], success: @escaping ()->(), failure: @escaping (_ error: Error)->()) {
        let jsonBody: Data
        do {
            jsonBody = try serializer.jsonData(for: events)
            logger.verbose("Request Send: \(jsonBody)")
        } catch  {
            failure(error)
            return
        }
        let request = buildRequest(baseURL: baseURL, method: "POST", contentType: "application/json; charset=utf-8", body: jsonBody)
        logSend(request: request)
        send(request: request, success: success, failure: failure)
    }
    
    private func buildRequest(baseURL: URL, method: String, contentType: String? = nil, body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: baseURL, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: timeout)
        request.httpMethod = method
        body.map { request.httpBody = $0 }
        contentType.map { request.setValue($0, forHTTPHeaderField: "Content-Type") }
        userAgent.map { request.setValue($0, forHTTPHeaderField: "User-Agent") }
        return request
    }
    
    private func send(request: URLRequest, success: @escaping ()->(), failure: @escaping (_ error: Error)->()) {
        let task = session.dataTask(with: request) { data, response, error in
            // should we check the response?
            let dataString = String(data: data!, encoding: String.Encoding.utf8)
            if let error = error {
                failure(error)
            } else {
                success()
            }
        }
        task.resume()
    }
    
}

