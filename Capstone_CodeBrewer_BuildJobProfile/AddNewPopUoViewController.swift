//
//  AddNewPopUoViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/17/21.
//

import UIKit

class AddNewPopUoViewController: UIViewController {
    
    weak var dashBoardVC: DashboardViewController!

    @IBOutlet weak var closeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func newResumeClicked(_ sender: Any) {
        dashBoardVC.openResumeBuilder()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func newCoverletterClicked(_ sender: Any) {
        dashBoardVC.openCoverBuilder()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
