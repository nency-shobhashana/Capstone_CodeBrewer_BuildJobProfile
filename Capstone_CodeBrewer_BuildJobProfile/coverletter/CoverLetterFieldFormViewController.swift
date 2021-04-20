//
//  CoverLetterFieldFormViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/18/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class CoverLetterFieldFormViewController: UIViewController, MDCBottomSheetMethod {
    
    weak var coverLetterDetailVC: CoverLetterDetailViewController!

    @IBOutlet weak var firstNameTF: MDCOutlinedTextField!
    @IBOutlet weak var lastNameTF: MDCOutlinedTextField!
    @IBOutlet weak var designationTF: MDCOutlinedTextField!
    @IBOutlet weak var profileLinkTF: MDCOutlinedTextField!
    @IBOutlet weak var LinkedInLinkTF: MDCOutlinedTextField!
    @IBOutlet weak var emailTF: MDCOutlinedTextField!
    @IBOutlet weak var phoneTF: MDCOutlinedTextField!
    @IBOutlet weak var addressTF: MDCOutlinedTextField!
    @IBOutlet weak var employerNameTF: MDCOutlinedTextField!
    @IBOutlet weak var employerCompanyNameTF: MDCOutlinedTextField!
    @IBOutlet weak var employerCompanyAddressNameTF: MDCOutlinedTextField!
    @IBOutlet weak var employerEmailTF: MDCOutlinedTextField!
    @IBOutlet weak var employerNumberNameTF: MDCOutlinedTextField!
    @IBOutlet weak var employerJobPostNameTF: MDCOutlinedTextField!
    @IBOutlet weak var collegeNameTF: MDCOutlinedTextField!
    @IBOutlet weak var majorTF: MDCOutlinedTextField!
    @IBOutlet weak var expYearTF: MDCOutlinedTextField!
    @IBOutlet weak var roleTF: MDCOutlinedTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sheetViewController!.handleScrollView(self.scrollView)

        // load data from core data to UI component
        firstNameTF.text = coverLetterDetailVC.coverLetterData["firstName"] as? String ?? ""
        lastNameTF.text = coverLetterDetailVC.coverLetterData["lastName"] as? String ?? ""
        designationTF.text = coverLetterDetailVC.coverLetterData["designation"] as? String ?? ""
        profileLinkTF.text = coverLetterDetailVC.coverLetterData["profile_link"] as? String ?? ""
        LinkedInLinkTF.text = coverLetterDetailVC.coverLetterData["linkedIn_link"] as? String ?? ""
        emailTF.text = coverLetterDetailVC.coverLetterData["email"] as? String ?? ""
        phoneTF.text = coverLetterDetailVC.coverLetterData["phone"] as? String ?? ""
        addressTF.text = coverLetterDetailVC.coverLetterData["address"] as? String ?? ""
        employerNameTF.text = coverLetterDetailVC.coverLetterData["employee_name"] as? String ?? ""
        employerCompanyNameTF.text = coverLetterDetailVC.coverLetterData["employee_cmpny_name"] as? String ?? ""
        employerCompanyAddressNameTF.text = coverLetterDetailVC.coverLetterData["employee_cmpny_address"] as? String ?? ""
        employerEmailTF.text = coverLetterDetailVC.coverLetterData["employee_email"] as? String ?? ""
        employerNumberNameTF.text = coverLetterDetailVC.coverLetterData["employee_number"] as? String ?? ""
        employerJobPostNameTF.text = coverLetterDetailVC.coverLetterData["job_post"] as? String ?? ""
        collegeNameTF.text = coverLetterDetailVC.coverLetterData["college_name"] as? String ?? ""
        majorTF.text = coverLetterDetailVC.coverLetterData["major"] as? String ?? ""
        expYearTF.text = coverLetterDetailVC.coverLetterData["exp_year"] as? String ?? ""
        roleTF.text = coverLetterDetailVC.coverLetterData["role"] as? String ?? ""
    }
    
    //MARK: - For hiding keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    func onDismiss() {
        coverLetterDetailVC.coverLetterData["firstName"] = firstNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["lastName"] = lastNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["designation"] = designationTF.text ?? ""
        coverLetterDetailVC.coverLetterData["profile_link"] = profileLinkTF.text ?? ""
        coverLetterDetailVC.coverLetterData["linkedIn_link"] = LinkedInLinkTF.text ?? ""
        coverLetterDetailVC.coverLetterData["email"] = emailTF.text ?? ""
        coverLetterDetailVC.coverLetterData["phone"] = phoneTF.text ?? ""
        coverLetterDetailVC.coverLetterData["address"] = addressTF.text ?? ""
        coverLetterDetailVC.coverLetterData["employee_name"] = employerNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["employee_cmpny_name"] = employerCompanyNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["employee_cmpny_address"] = employerCompanyAddressNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["employee_email"] = employerEmailTF.text ?? ""
        coverLetterDetailVC.coverLetterData["employee_number"] = employerNumberNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["job_post"] = employerJobPostNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["college_name"] = collegeNameTF.text ?? ""
        coverLetterDetailVC.coverLetterData["major"] = majorTF.text ?? ""
        coverLetterDetailVC.coverLetterData["exp_year"] = expYearTF.text ?? ""
        coverLetterDetailVC.coverLetterData["role"] = roleTF.text ?? ""
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
        
        designationTF.label.text = "Designation"
        designationTF.placeholder = "Designation"
        designationTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        designationTF.sizeToFit()
        
        profileLinkTF.label.text = "Profile Link"
        profileLinkTF.placeholder = "Profile Link"
        profileLinkTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        profileLinkTF.sizeToFit()
        
        LinkedInLinkTF.label.text = "LinkedIn Link"
        LinkedInLinkTF.placeholder = "LinkedIn Link"
        LinkedInLinkTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        LinkedInLinkTF.sizeToFit()
        
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
        
        employerNameTF.label.text = "Employee Name"
        employerNameTF.placeholder = "Employee name"
        employerNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerNameTF.sizeToFit()
        
        employerCompanyNameTF.label.text = "Employee Company Name"
        employerCompanyNameTF.placeholder = "Employee Company Name"
        employerCompanyNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerCompanyNameTF.sizeToFit()
        
        employerCompanyAddressNameTF.label.text = "Employee Company Address"
        employerCompanyAddressNameTF.placeholder = "Employee Company Address"
        employerCompanyAddressNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerCompanyAddressNameTF.sizeToFit()
        
        employerEmailTF.label.text = "Employee E-mail"
        employerEmailTF.placeholder = "Employee E-mail"
        employerEmailTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerEmailTF.sizeToFit()
        
        employerNumberNameTF.label.text = "Employee Number"
        employerNumberNameTF.placeholder = "Employee Number"
        employerNumberNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerNumberNameTF.sizeToFit()
        
        employerJobPostNameTF.label.text = "Where you find job post"
        employerJobPostNameTF.placeholder = "Where you find job post"
        employerJobPostNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        employerJobPostNameTF.sizeToFit()
        
        collegeNameTF.label.text = "College Name"
        collegeNameTF.placeholder = "COllege Name"
        collegeNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        collegeNameTF.sizeToFit()
        
        majorTF.label.text = "Major"
        majorTF.placeholder = "Major"
        majorTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        majorTF.sizeToFit()
        
        expYearTF.label.text = "Experinced Year"
        expYearTF.placeholder = "Experinced Year"
        expYearTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        expYearTF.sizeToFit()
        
        roleTF.label.text = "Role or Experinced Field"
        roleTF.placeholder = "Role or Experinced Field"
        roleTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        roleTF.sizeToFit()
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        coverLetterDetailVC.bottomSheet?.dismiss(animated: true, completion: nil)
    }
}
