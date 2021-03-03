import UIKit
import HubjsTracker

class EventsViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","events"])
    }
    @IBAction func trackEventButtonTapped(_ sender: UIButton) {
        HubjsTracker.shared.track(eventWithCategory: "TestCategory", action: "TestAction", name: "TestName", value: 7)
    }
}
