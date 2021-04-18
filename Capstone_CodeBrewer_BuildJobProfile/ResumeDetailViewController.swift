//
//  ResumeDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit
import CoreData
import MaterialComponents.MaterialBottomSheet

class ResumeDetailViewController: UIViewController, MDCBottomSheetControllerDelegate {
    var bottomSheet:MDCBottomSheetController? = nil
    
    weak var coreDataContex: NSManagedObjectContext!
//    var resumeData: ResumeDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveResumeDetail()
        // Do any additional setup after loading the view.
    }
    
    // retrieve ResumeDetail
    func retrieveResumeDetail(){
        
    }
    
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        do {
            try coreDataContex.save()
        } catch {
            print("Error loading Category \(error.localizedDescription)")
        }
        bottomSheet = nil
    }
    
    // MARK: - Resume Personal Detail
    @IBAction func personalClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumePersonalViewController") as! ResumePersonalViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet?.trackingScrollView = bottomSheetVC.scrollView
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
    // MARK: - Resume Profile Link
    @IBAction func profileLinksClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeProfileLinkViewController") as! ResumeProfileLinkViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
    // MARK: - Resume Professional Summary
    @IBAction func resumeSummaryClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSummaryViewController") as! ResumeSummaryViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Education
    @IBAction func resumeEducationClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeEducationViewController") as! ResumeEducationViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Experince
    @IBAction func resumeExperinceClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeExperianceViewController") as! ResumeExperianceViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Skills
    @IBAction func resumeSkilsClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSkilsViewController") as! ResumeSkilsViewController
        bottomSheetVC.resumeDetailVC = self
//        bottomSheetVC.resumeData = self.resumeData
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        performSegue(withIdentifier: "ResumeTemplateChoose", sender: self)
    }
    
}
