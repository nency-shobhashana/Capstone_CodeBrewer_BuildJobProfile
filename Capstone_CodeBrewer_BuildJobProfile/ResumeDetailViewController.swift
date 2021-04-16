//
//  ResumeDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class ResumeDetailViewController: UIViewController, MDCBottomSheetControllerDelegate {
    var bottomSheet:MDCBottomSheetController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        bottomSheet = nil
    }
    
    // MARK: - Resume Personal Detail
    @IBAction func personalClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumePersonalViewController") as! ResumePersonalViewController
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
    // MARK: - Resume Profile Link
    @IBAction func profileLinksClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeProfileLinkViewController") as! ResumeProfileLinkViewController
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
}
