@testable import HubjsTracker

final class DispatcherStub: Dispatcher {

    public var baseURL: URL = URL(string: "http://analytics.hub-js.com/tracking.php")!

    struct Callback {
        typealias SendEvents = (_ events: [Event], _ success: () -> (), _ failure: (Error) -> ()) -> ()
    }
    
    var sendEvents: Callback.SendEvents? = nil
    
    let userAgent: String? = "DispatcherStub"
    
    func send(event: Event, success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.send(events: [event], success: success, failure: failure)
        }
    }
    
    func send(events: [Event], success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.sendEvents?(events, success, failure)
        }
    }
}
