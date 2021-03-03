import UIKit
import HubjsTracker

class CampaignViewController: UIViewController {
    
    @IBOutlet weak var campaignNameTextField: UITextField!
    @IBOutlet weak var campaignKeywordTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","campaign tracking"])
    }
    
    @IBAction func didTapTrackCampaignButton(_ sender: UIButton) {
        let name = campaignNameTextField.text
        let keyword = campaignKeywordTextField.text
        
        HubjsTracker.shared.trackCampaign(name: name, keyword: keyword)
    }
    
}


