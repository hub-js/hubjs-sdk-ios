import Foundation
import HubjsTracker

extension HubjsTracker {
    static let shared: HubjsTracker = {
        let queue = UserDefaultsQueue(UserDefaults.standard, autoSave: true)
        let dispatcher = URLSessionDispatcher(baseURL: URL(string: "https://analytics.hub-js.com/tracking.php")!)
        let hubjsTracker = HubjsTracker(siteId: "1", queue: queue, dispatcher: dispatcher)
        hubjsTracker.logger = DefaultLogger(minLevel: .verbose)
        hubjsTracker.migrateFromFourPointFourSharedInstance()
        return hubjsTracker
    }()
    
    private func migrateFromFourPointFourSharedInstance() {
        guard !UserDefaults.standard.bool(forKey: "migratedFromFourPointFourSharedInstance") else { return }
        copyFromOldSharedInstance()
        UserDefaults.standard.set(true, forKey: "migratedFromFourPointFourSharedInstance")
    }
}
