import UIKit
import HubjsTracker

class CustomDimensionsViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","custom dimensions"])
    }
    
    // Adds Custom Dimensions to every Event for OS version, Hardware and App version.
    @IBAction func setVisitCustomDimensionsTapped(_ sender: UIButton) {
        let application = Application.makeCurrentApplication()
        let device = Device.makeCurrentDevice()
        HubjsTracker.shared.setDimension(device.osVersion, forIndex: 1)
        HubjsTracker.shared.setDimension(device.platform, forIndex: 2)
        HubjsTracker.shared.setDimension(application.bundleShortVersion ?? "unknown", forIndex: 3)
    }
}
