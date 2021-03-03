import UIKit
import HubjsTracker

class ConfigurationViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","configuration"])
    }
    
    @IBAction func newSessionButtonTapped(_ sender: UIButton) {
        HubjsTracker.shared.startNewSession()
    }
    
    @IBAction func dispatchButtonTapped(_ sender: UIButton) {
        HubjsTracker.shared.dispatch()
    }

}
