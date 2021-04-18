//
//  ResumeDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import MaterialComponents.MaterialBottomSheet

class ResumeDetailViewController: UIViewController, MDCBottomSheetControllerDelegate {
    var bottomSheet:MDCBottomSheetController? = nil
    
    var ref: DatabaseReference!
    var resumeTitle: String? = nil
    var resumeData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users/\(Auth.auth().currentUser?.uid ?? "")/resume")
        
        retrieveResumeDetail()
        // Do any additional setup after loading the view.
    }
    
    // retrieve ResumeDetail
    func retrieveResumeDetail(){
        ref.child(resumeTitle!).getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! Dictionary<String, Any>
                self.resumeData = value
            }
            else {
                self.resumeData = Dictionary<String, Any>()
            }
        }
        
    }
    
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        (controller.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        if resumeTitle != nil{
            ref.child(resumeTitle!).setValue(resumeData)
        }
        bottomSheet = nil
    }
    
    // MARK: - Resume Personal Detail
    @IBAction func personalClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumePersonalViewController") as! ResumePersonalViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet?.trackingScrollView = bottomSheetVC.scrollView
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
    // MARK: - Resume Profile Link
    @IBAction func profileLinksClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeProfileLinkViewController") as! ResumeProfileLinkViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    
    // MARK: - Resume Professional Summary
    @IBAction func resumeSummaryClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSummaryViewController") as! ResumeSummaryViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Education
    @IBAction func resumeEducationClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeEducationViewController") as! ResumeEducationViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Experince
    @IBAction func resumeExperinceClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeExperianceViewController") as! ResumeExperianceViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - Resume Skills
    @IBAction func resumeSkilsClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSkilsViewController") as! ResumeSkilsViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - choose template navigation
    @IBAction func nextClicked(_ sender: Any) {
        performSegue(withIdentifier: "ResumeTemplateChoose", sender: resumeTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResumeTemplateChoose"{
            let vc = (segue.destination as! ResumeChooseTemplateViewController)
            vc.resumeTitle = self.resumeTitle
            vc.resumeData = self.resumeData
            
        }
    }
}

