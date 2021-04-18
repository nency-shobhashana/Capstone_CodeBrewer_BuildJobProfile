//
//  Resume.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/14/21.
//

import Foundation
import UIKit

protocol MDCBottomSheetMethod {
    func onDismiss()
}

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

struct ResumeDetail {
    var firstName: String?
    var lastName: String?
    var email: String?
    var phoneNo: String?
    var address: String?
    var education: [ResumeEducation]
    var experience : [ResumeExperience]
}

struct ResumeEducation {
    var name: String
    var major: String
    var startYear: String
    var endYear: String
}

struct ResumeExperience {
    var name: String
    var role: String
    var startYear: String
    var endYear: String
}


