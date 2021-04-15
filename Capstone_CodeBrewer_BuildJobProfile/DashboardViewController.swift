//
//  DashboardViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Archit Sureja on 14/04/21.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Resume
        } else {
            // Cover Letter
        }
    }
}
