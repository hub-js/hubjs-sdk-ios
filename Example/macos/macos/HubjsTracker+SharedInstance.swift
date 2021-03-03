import Foundation
import HubjsTracker

extension HubjsTracker {
    static let shared: HubjsTracker = {
        let hubjsTracker = HubjsTracker(siteId: "1", baseURL: URL(string: "https://analytics.hub-js.com/tracking.php")!)
        hubjsTracker.logger = DefaultLogger(minLevel: .info)
        hubjsTracker.migrateFromFourPointFourSharedInstance()
        return hubjsTracker
    }()
    
    private func migrateFromFourPointFourSharedInstance() {
        guard !UserDefaults.standard.bool(forKey: "migratedFromFourPointFourSharedInstance") else { return }
        copyFromOldSharedInstance()
        UserDefaults.standard.set(true, forKey: "migratedFromFourPointFourSharedInstance")
    }
}
