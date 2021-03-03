import Foundation

/// HubjsUserDefaults is a wrapper for the UserDefaults with properties
/// mapping onto values stored in the UserDefaults.
/// All getter and setter are sideeffect free and automatically syncronize
/// after writing.
internal struct HubjsUserDefaults {
    let userDefaults: UserDefaults

    init(suiteName: String?) {
        userDefaults = UserDefaults(suiteName: suiteName)!
    }
    
    var totalNumberOfVisits: Int {
        get {
            return userDefaults.integer(forKey: HubjsUserDefaults.Key.totalNumberOfVisits)
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.totalNumberOfVisits)
            userDefaults.synchronize()
        }
    }
    
    var firstVisit: Date? {
        get {
            return userDefaults.object(forKey: HubjsUserDefaults.Key.firstVistsTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.firstVistsTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var previousVisit: Date? {
        get {
            return userDefaults.object(forKey: HubjsUserDefaults.Key.previousVistsTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.previousVistsTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var currentVisit: Date? {
        get {
            return userDefaults.object(forKey: HubjsUserDefaults.Key.currentVisitTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.currentVisitTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var optOut: Bool {
        get {
            return userDefaults.bool(forKey: HubjsUserDefaults.Key.optOut)
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.optOut)
            userDefaults.synchronize()
        }
    }
    
    var clientId: String? {
        get {
            return userDefaults.string(forKey: HubjsUserDefaults.Key.clientID)
        }
        set {
            userDefaults.setValue(newValue, forKey: HubjsUserDefaults.Key.clientID)
            userDefaults.synchronize()
        }
    }
    
    var forcedVisitorId: String? {
        get {
            return userDefaults.string(forKey: HubjsUserDefaults.Key.forcedVisitorID)
        }
        set {
            userDefaults.setValue(newValue, forKey: HubjsUserDefaults.Key.forcedVisitorID)
            userDefaults.synchronize()
        }
    }
    
    var visitorUserId: String? {
        get {
            return userDefaults.string(forKey: HubjsUserDefaults.Key.visitorUserID);
        }
        set {
            userDefaults.setValue(newValue, forKey: HubjsUserDefaults.Key.visitorUserID);
            userDefaults.synchronize()
        }
    }
    
    var lastOrder: Date? {
        get {
            return userDefaults.object(forKey: HubjsUserDefaults.Key.lastOrder) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: HubjsUserDefaults.Key.lastOrder)
        }
    }
}

extension HubjsUserDefaults {
    public mutating func copy(from userDefaults: UserDefaults) {
        totalNumberOfVisits = UserDefaults.standard.integer(forKey: HubjsUserDefaults.Key.totalNumberOfVisits)
        firstVisit = UserDefaults.standard.object(forKey: HubjsUserDefaults.Key.firstVistsTimestamp) as? Date
        previousVisit = UserDefaults.standard.object(forKey: HubjsUserDefaults.Key.previousVistsTimestamp) as? Date
        currentVisit = UserDefaults.standard.object(forKey: HubjsUserDefaults.Key.currentVisitTimestamp) as? Date
        optOut = UserDefaults.standard.bool(forKey: HubjsUserDefaults.Key.optOut)
        clientId = UserDefaults.standard.string(forKey: HubjsUserDefaults.Key.clientID)
        forcedVisitorId = UserDefaults.standard.string(forKey: HubjsUserDefaults.Key.forcedVisitorID)
        visitorUserId = UserDefaults.standard.string(forKey: HubjsUserDefaults.Key.visitorUserID)
        lastOrder = UserDefaults.standard.object(forKey: HubjsUserDefaults.Key.lastOrder) as? Date
    }
}

extension HubjsUserDefaults {
    internal struct Key {
        static let totalNumberOfVisits = "HubjsTotalNumberOfVistsKey"
        static let currentVisitTimestamp = "HubjsCurrentVisitTimestampKey"
        static let previousVistsTimestamp = "HubjsPreviousVistsTimestampKey"
        static let firstVistsTimestamp = "HubjsFirstVistsTimestampKey"
        
        // Note:    To be compatible with previous versions, the clientID key retains its old value,
        //          even though it is now a misnomer since adding visitorUserID makes it a bit confusing.
        static let clientID = "HubjsVisitorIDKey"
        static let forcedVisitorID = "HubjsForcedVisitorIDKey"
        static let visitorUserID = "HubjsVisitorUserIDKey"
        static let optOut = "HubjsOptOutKey"
        static let lastOrder = "HubjsLastOrderDateKey"
    }
}
