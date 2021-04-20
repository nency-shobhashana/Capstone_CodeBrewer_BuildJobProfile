//
//  ResumeDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FittedSheets

class ResumeDetailViewController: UIViewController {
    var bottomSheet:SheetViewController? = nil
    
    @IBOutlet weak var nextButton: UIButton!
    
    var ref: DatabaseReference!
    var resumeTitle: String? = nil
    var resumeData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users/\(Auth.auth().currentUser?.uid ?? "")/resume")
        
        retrieveResumeDetail()
        nextButton.isEnabled = false
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
                if self.isImpDataThere() {
                    DispatchQueue.main.async {
                        self.nextButton.isEnabled = true
                    }
                }
            }
            else {
                self.resumeData = Dictionary<String, Any>()
            }
        }
        
    }
    
    func isImpDataThere() -> Bool {
        return (resumeData["firstName"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false && (resumeData["lastName"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false && (resumeData["email"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
    }
    
    func saveDataOnSheetDismiss() {
        if resumeTitle != nil && isImpDataThere() {
            ref.child(resumeTitle!).setValue(resumeData)
            nextButton.isEnabled = true
        }
        bottomSheet = nil
    }
    
    // MARK: - Resume Personal Detail
    @IBAction func personalClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumePersonalViewController") as! ResumePersonalViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
    }
    
    
    // MARK: - Resume Profile Link
    @IBAction func profileLinksClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeProfileLinkViewController") as! ResumeProfileLinkViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
    }
    
    
    // MARK: - Resume Professional Summary
    @IBAction func resumeSummaryClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSummaryViewController") as! ResumeSummaryViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
    }
    
    // MARK: - Resume Education
    @IBAction func resumeEducationClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeEducationViewController") as! ResumeEducationViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
    }
    
    // MARK: - Resume Experince
    @IBAction func resumeExperinceClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeExperianceViewController") as! ResumeExperianceViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
    }
    
    // MARK: - Resume Skills
    @IBAction func resumeSkilsClicked(_ sender: Any) {
        bottomSheet?.attemptDismiss(animated: true)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "ResumeSkilsViewController") as! ResumeSkilsViewController
        bottomSheetVC.resumeDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
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
