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
        bottomSheet?.trackingScrollView = bottomSheetVC.scrollView
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
    
    
    // MARK: - Resume Professional Summary
    @IBAction func resumeSummaryClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSummaryViewController") as! ResumeSummaryViewController
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Education
    @IBAction func resumeEducationClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeEducationViewController") as! ResumeEducationViewController
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Experince
    @IBAction func resumeExperinceClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeExperianceViewController") as! ResumeExperianceViewController
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Skills
        @IBAction func resumeSkilsClicked(_ sender: Any) {
            bottomSheet?.dismiss(animated: true, completion: nil)
            let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSkilsViewController") as! ResumeSkilsViewController
            bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
            present(bottomSheet!,animated: true, completion: nil)
            bottomSheet?.delegate = self
        }

    
}
