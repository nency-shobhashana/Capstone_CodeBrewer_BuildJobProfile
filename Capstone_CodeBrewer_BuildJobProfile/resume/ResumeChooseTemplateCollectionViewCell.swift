//
//  ResumeChooseTemplateCollectionViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeChooseTemplateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var templateImageView: UIImageView!
    @IBOutlet weak var templateName: UITextField!
    
    func setup(with data: ResumeTemplate) {
        templateImageView.image = data.image
        templateName.text = data.name
    }
    
}
