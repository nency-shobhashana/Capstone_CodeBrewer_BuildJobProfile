//
//  ResumeCollectionViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/14/21.
//

import UIKit

class ResumeCollectionViewCell: UICollectionViewCell {
    
    weak var dashboardViewController: DashboardViewController!
    
    @IBOutlet weak var resumeImageView: UIImageView!
    @IBOutlet weak var resumeTitle: UILabel!
    var data: DataCollection!
    var isResume = false
    
    func setup(with data: DataCollection, isResume: Bool) {
        self.data = data
        self.isResume = isResume
        resumeImageView.image = data.image
        resumeTitle.text = data.title
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        dashboardViewController.removeData(isResume: isResume, title: data.title)
    }
}
