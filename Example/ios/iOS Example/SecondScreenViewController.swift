import UIKit
import HubjsTracker

class SecondScreenViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","screen view", "screen view 2"])
    }
}
