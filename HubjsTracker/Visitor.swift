import Foundation

struct Visitor: Codable {
    /// Unique ID per visitor (device in this case). Should be
    /// generated upon first start and never changed after.
    /// api-key: _id
    let id: String
    
    /// A unique visitor ID, possuble to override by the SDK user.
    /// api-key: cid
    let forcedId: String?
    
    /// An optional user identifier such as email or username.
    /// api-key: uid
    let userId: String?
}

extension Visitor {
    static func current(in hubjsUserDefaults: HubjsUserDefaults) -> Visitor {
        var hubjsUserDefaults = hubjsUserDefaults
        let id: String
        if let existingId = hubjsUserDefaults.clientId {
            id = existingId
        } else {
            let newId = newVisitorID()
            hubjsUserDefaults.clientId = newId
            id = newId
        }
        let forcedVisitorId = hubjsUserDefaults.forcedVisitorId
        let userId = hubjsUserDefaults.visitorUserId
        return Visitor(id: id, forcedId: forcedVisitorId, userId: userId)
    }
    
    static func newVisitorID() -> String {
        let uuid = UUID().uuidString
        let sanitizedUUID = uuid.replacingOccurrences(of: "-", with: "")
        let start = sanitizedUUID.startIndex
        let end = sanitizedUUID.index(start, offsetBy: 16)
        return String(sanitizedUUID[start..<end])
    }
}
