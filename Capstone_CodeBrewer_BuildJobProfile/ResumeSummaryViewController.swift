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

class ResumeSummaryViewController: UIViewController {
    
    weak var resumeDetailVC: ResumeDetailViewController!
//    weak var resumeData: ResumeDetail!
    
    @IBOutlet weak var summaryTF: MDCOutlinedTextArea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data from core data to UI component
//        summaryTF.textView.text = resumeData.preofessionalSummary ?? ""
    }
    
    // store user data in to core data component
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        resumeData.preofessionalSummary = summaryTF.textView.text ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configTextAreaField()
    }
    
    private func configTextAreaField() {
        summaryTF.label.text = "Professional Summary"
        summaryTF.placeholder = "Professional Summary"
        summaryTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
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
