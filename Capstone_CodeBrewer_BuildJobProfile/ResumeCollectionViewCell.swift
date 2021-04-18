//
//  ResumeCollectionViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/14/21.
//

import UIKit

class ResumeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resumeImageView: UIImageView!
    @IBOutlet weak var resumeTitle: UILabel!
    
    func setup(with data: DataCollection) {
        resumeImageView.image = data.image
        resumeTitle.text = data.title
    }
}
