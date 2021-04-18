//
//  ExperianceTableViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import MaterialComponents.MaterialCards
import MaterialComponents.MaterialCards_Theming
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class ExperianceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: MDCCard!
    @IBOutlet weak var companyNameTF: MDCOutlinedTextField!
    @IBOutlet weak var designationTF: MDCOutlinedTextField!
    @IBOutlet weak var startYearTF: MDCOutlinedTextField!
    @IBOutlet weak var endYearTF: MDCOutlinedTextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configTextField()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var experince: ResumeExperience? = nil
    
    func initCell(experince: ResumeExperience){
        saveData()
        self.experince = experince
    }
    
    func saveData(){
        self.experince?.name = companyNameTF.text ?? ""
        self.experince?.role = designationTF.text ?? ""
        self.experince?.startYear = startYearTF.text ?? ""
        self.experince?.endYear = endYearTF.text ?? ""
    }
    
    
    private func configTextField(){
        let containerScheme = MDCContainerScheme()
        cardView.applyTheme(withScheme: containerScheme)
        companyNameTF.label.text = "Company Name"
        companyNameTF.placeholder = "Company Name"
        companyNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        companyNameTF.sizeToFit()
        
        designationTF.label.text = "Designation / Role"
        designationTF.placeholder = "Designation / Role"
        designationTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        designationTF.sizeToFit()
        
        startYearTF.label.text = "Start Date"
        startYearTF.placeholder = "Start Date"
        startYearTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        startYearTF.sizeToFit()
        
        endYearTF.label.text = "End Date"
        endYearTF.placeholder = "End Date"
        endYearTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        endYearTF.sizeToFit()
        
    }
    
}
