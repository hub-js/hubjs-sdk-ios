import UIKit
import HubjsTracker

class MenuViewController: UITableViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(eventWithCategory: "timing", action: "one")
        HubjsTracker.shared.track(view: ["menu"])
        HubjsTracker.shared.track(eventWithCategory: "timing", action: "two")
    }
}
