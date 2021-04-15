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
    
    @IBOutlet weak var firstNameTF: MDCOutlinedTextField!
    @IBOutlet weak var lastNameTF: MDCOutlinedTextField!
    @IBOutlet weak var emailTF: MDCOutlinedTextField!
    @IBOutlet weak var phoneTF: MDCOutlinedTextField!
    @IBOutlet weak var addressTF: MDCOutlinedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    func prepareBackgroundView(){
            let blurEffect = UIBlurEffect.init(style: .light)
            let visualEffect = UIVisualEffectView.init(effect: blurEffect)
            let bluredView = UIVisualEffectView.init(effect: blurEffect)
            bluredView.contentView.addSubview(visualEffect)
            
            visualEffect.frame = UIScreen.main.bounds
            bluredView.frame = UIScreen.main.bounds
            
            view.insertSubview(bluredView, at: 0)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareBackgroundView()
        configTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) { [weak self] in
                    let frame = self?.view.frame
                    let yComponent = UIScreen.main.bounds.height - 400
                    self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
                }
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
    
    @IBAction func closeClicked(_ sender: Any) {
        willMove(toParent: nil)
               view.removeFromSuperview()
               removeFromParent()
        
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
