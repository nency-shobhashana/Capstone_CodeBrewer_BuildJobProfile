//
//  ResumeProfileLinkViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming
import MaterialComponents.MaterialBottomSheet

class ResumeProfileLinkViewController: UIViewController {
    
    @IBOutlet weak var portfolioTF: MDCOutlinedTextField!
    @IBOutlet weak var linkedInTF: MDCOutlinedTextField!
    @IBOutlet weak var gitHubTF: MDCOutlinedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTextField()
    }

    private func configTextField(){
        portfolioTF.label.text = "Portfolio Link"
        portfolioTF.placeholder = "Portfolio Link"
        portfolioTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        portfolioTF.sizeToFit()
        
        linkedInTF.label.text = "LinkedIn Profile Link"
        linkedInTF.placeholder = "LinkedIn Profile Link"
        linkedInTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        linkedInTF.sizeToFit()
        
        gitHubTF.label.text = "GitHub Link"
        gitHubTF.placeholder = "GitHub Link"
        gitHubTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        gitHubTF.sizeToFit()
        
    }
}