//
//  ContentViewController.swift
//  ios
//
//  Created by miang on 20/6/2561 BE.
//  Copyright © 2561 Mattias Levin. All rights reserved.
//

import UIKit
import HubjsTracker

class ContentTrackerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HubjsTracker.shared.trackContentImpression(name: "Content name", piece: "button", target: "http://dn.se")
    }
    
    @IBAction func adInteraction(_ sender: Any) {
        HubjsTracker.shared.trackContentInteraction(name: "Content name", interaction: "click", piece: "button", target: "http://dn.se")
        UIApplication.shared.openURL(URL(string: "http://dn.se")!)
    }
}

