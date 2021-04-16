//
//  EducationTableViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import MaterialComponents.MaterialCards
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming


class EducationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var instituteNameTF: MDCOutlinedTextField!
    @IBOutlet weak var majorTF: MDCOutlinedTextField!
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
    
    private func configTextField(){
        instituteNameTF.label.text = "Institute Name"
        instituteNameTF.placeholder = "Institute Name"
        instituteNameTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        instituteNameTF.sizeToFit()
        
        majorTF.label.text = "Major"
        majorTF.placeholder = "Major"
        majorTF.setOutlineColor(UIColor.systemGreen, for: MDCTextControlState.editing)
        majorTF.sizeToFit()
        
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
