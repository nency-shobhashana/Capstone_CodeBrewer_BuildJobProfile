//
//  Resume.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/14/21.
//

import Foundation
import UIKit


protocol DataCollection{
    var title: String { get }
    var image: UIImage { get }
}
struct Resume : DataCollection {
    var title: String
    var image: UIImage
}
struct CoverLetter : DataCollection {
    var title: String
    var image: UIImage
}

let resumes: [Resume] = [
    Resume(title: "Mobile Developer", image: UIImage(named: "resume")!),
    Resume(title: "Android Developer", image: UIImage(named: "resume1")!),
    Resume(title: "iOS Developer", image: UIImage(named: "resume2")!)
]

struct ResumeEducation {
    var name: String
    var major: String
    var startYear: String
    var endYear: String
}

struct ResumeExperince {
    var name: String
    var role: String
    var startYear: String
    var endYear: String
}


