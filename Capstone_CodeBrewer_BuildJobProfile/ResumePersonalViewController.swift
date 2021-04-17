//
//  ResumePersonalViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 15/04/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class ResumePersonalViewController: UIViewController {
    
    weak var resumeDetailVC: ResumeDetailViewController!
    weak var resumeData: ResumeDetail!
    
    @IBOutlet weak var firstNameTF: MDCOutlinedTextField!
    @IBOutlet weak var lastNameTF: MDCOutlinedTextField!
    @IBOutlet weak var emailTF: MDCOutlinedTextField!
    @IBOutlet weak var phoneTF: MDCOutlinedTextField!
    @IBOutlet weak var addressTF: MDCOutlinedTextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.text = resumeData.firstName ?? ""
        lastNameTF.text = resumeData.lastName ?? ""
        emailTF.text = resumeData.email ?? ""
        phoneTF.text = resumeData.phone ?? ""
        addressTF.text = resumeData.address ?? ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        resumeData.firstName = firstNameTF.text ?? ""
        resumeData.lastName = lastNameTF.text ?? ""
        resumeData.email = emailTF.text ?? ""
        resumeData.phone = phoneTF.text ?? ""
        resumeData.address = addressTF.text ?? ""
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTextField()
    }
    
    
    private func configTextField(){
        firstNameTF.label.text = "First Name"
        firstNameTF.placeholder = "First Name"
        firstNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        firstNameTF.sizeToFit()
        
        lastNameTF.label.text = "Last Name"
        lastNameTF.placeholder = "Last Name"
        lastNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        lastNameTF.sizeToFit()
        
        emailTF.label.text = "Email"
        emailTF.placeholder = "Email"
        emailTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        emailTF.sizeToFit()
        
        phoneTF.label.text = "Phone Number"
        phoneTF.placeholder = "(555) 555-5555"
        phoneTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        phoneTF.sizeToFit()
        
        addressTF.label.text = "Address"
        addressTF.placeholder = "Address"
        addressTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        addressTF.sizeToFit()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        resumeDetailVC.profileLinksClicked(sender)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
