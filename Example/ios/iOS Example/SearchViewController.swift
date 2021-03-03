import UIKit
import HubjsTracker

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HubjsTracker.shared.track(view: ["menu","search"])
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        HubjsTracker.shared.trackSearch(query: query, category: "HubjsTracker Search", resultCount: Int(arc4random_uniform(100)))
    }
}

