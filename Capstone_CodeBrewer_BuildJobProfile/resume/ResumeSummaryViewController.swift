//
//  ResumeSummaryViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class ResumeSummaryViewController: UIViewController, MDCBottomSheetMethod {
    
    weak var resumeDetailVC: ResumeDetailViewController!
    
    @IBOutlet weak var designationTF: MDCOutlinedTextField!
    @IBOutlet weak var summaryTF: MDCOutlinedTextArea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data from core data to UI component
        summaryTF.textView.text = resumeDetailVC.resumeData["professionalSummary"] as? String ?? ""
        designationTF.text = resumeDetailVC.resumeData["designation"] as? String ?? ""
    }
    
    // store user data in to core data component
    func onDismiss() {
        resumeDetailVC.resumeData["professionalSummary"] = summaryTF.textView.text ?? ""
        resumeDetailVC.resumeData["designation"] = designationTF.text ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configTextAreaField()
    }
    
    private func configTextAreaField() {
        designationTF.label.text = "Current Designation"
        designationTF.placeholder = "Current Designation"
        designationTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        designationTF.sizeToFit()
        
        summaryTF.label.text = "Professional Summary"
        summaryTF.placeholder = "Professional Summary"
        summaryTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        summaryTF.sizeThatFits(CGSize(width: summaryTF.frame.width, height: 150))
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func nextClicked(_ sender: Any) {
        resumeDetailVC.resumeEducationClicked(sender)
    }
}
