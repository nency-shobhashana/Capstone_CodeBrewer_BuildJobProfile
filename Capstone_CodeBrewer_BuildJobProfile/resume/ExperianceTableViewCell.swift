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
    @IBOutlet weak var descriptionTA: MDCOutlinedTextArea!
    
    
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
    var index: Int = -1
    func initCell(experince: ResumeExperience, index: Int){
        
        self.experince = experince
        self.index = index
        
        companyNameTF.text = self.experince?.name ?? ""
        designationTF.text = self.experince?.role ?? ""
        startYearTF.text = self.experince?.startYear ?? ""
        endYearTF.text = self.experince?.endYear ?? ""
        descriptionTA.textView.text = self.experince?.description ?? ""
    }
    
    func saveData() -> ResumeExperience? {
        self.experince?.name = companyNameTF.text ?? ""
        self.experince?.role = designationTF.text ?? ""
        self.experince?.startYear = startYearTF.text ?? ""
        self.experince?.endYear = endYearTF.text ?? ""
        self.experince?.description = descriptionTA.textView.text ?? ""
        return self.experince
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
        
        descriptionTA.label.text = "Description"
        descriptionTA.placeholder = "Description"
        descriptionTA.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        descriptionTA.sizeToFit()
    }
    
}
