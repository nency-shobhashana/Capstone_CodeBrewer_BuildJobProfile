//
//  CoverLetterChooseTemplateCollectionViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/18/21.
//

import UIKit

class CoverLetterChooseTemplateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var templateImageView: UIImageView!
    @IBOutlet weak var templateName: UITextField!
    
    func setup(with data: CoverLetterTemplate) {
        templateImageView.image = data.image
        templateName.text = data.name
    }
    
}
