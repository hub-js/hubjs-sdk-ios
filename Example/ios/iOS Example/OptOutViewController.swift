import UIKit
import HubjsTracker

class OptOutViewController: UIViewController {
    
    @IBOutlet weak var optOutSwitch: UISwitch!
    @IBAction func optOutSwitchChanged(_ sender: Any) {
        HubjsTracker.shared.isOptedOut = optOutSwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optOutSwitch.isOn = HubjsTracker.shared.isOptedOut
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","opt out"])
    }
}
