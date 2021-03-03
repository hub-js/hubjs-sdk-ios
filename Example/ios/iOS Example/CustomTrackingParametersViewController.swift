import UIKit
import HubjsTracker

class CustomTrackingParametersViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","custom tracking parameters"])
    }
    
    @IBAction func didTapSendDownloadEvent(_ sender: UIButton) {
        let downloadURL = URL(string: "https://analytics.hub-js.com/hubjs.zip")!
        let event = Event(tracker: HubjsTracker.shared, action: ["menu", "custom tracking parameters"], url: downloadURL, customTrackingParameters: ["download": downloadURL.absoluteString], isCustomAction: false)
        HubjsTracker.shared.track(event)
    }

}

