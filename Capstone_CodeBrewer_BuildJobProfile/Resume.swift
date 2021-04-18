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

struct ResumeTemplate{
    var name: String
    var image: UIImage
    var content: String
}

let resumeTemplate = [
    ResumeTemplate(name:"Template 1",
                   image: UIImage(named: "resume")!,
                   content: "<html><body><table><tr><table width=100%><tr><td width=70%><h2>#FIRST_NAME #LAST_NAME</h2></td><td width=30% align=right><h3>#DESIGNATION</h3></td></tr><tr><td width=70%>#PROFILE_LINK</td><td width=30% align=right>#EMAIL</td></tr><tr><td width=70%>#LINKEDIN_LINK</td><td width=30% align=right>#NUMBER</td></tr><tr><td width=70%>#ADDRESS</td><td width=30% align=right>&nbsp;</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>PROFESSIONAL SUMMARY</h3></td></tr><tr><td>#FIRST_NAME is a <b>sophomore</b> at <b>#COLLEGE_NAME</b> majoring in <b>#MAJOR</b> and has <b>#EXP_YEAR years</b> of experience in <b>#ROLE</b>. Committed to delivering high-level solutions that increase business and result in exceptional cost efficiencies and seeking an opportunity where she can apply herself to challenging opportunities in connecting business requirements with Emerging Technologie.</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>EDUCATION</h3></td></tr><tr><td><table width=100%><tr><td><b>#MAJOR</b>[#START_DATE - March 2019]</td></tr><tr><td>#COLLEGE_NAME</td></tr></table></td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>KEY SKILLS</h3></td></tr><tr><td>#SKILLS</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>PROFESSIONAL EXPERIENCE</h3></td></tr><tr><td><table width=100%><tr><td><b>Web Developer</b>[April 2018 - March 2019]</td></tr><tr><td>Parex Technologies, Ahmedabad</td></tr><tr><td><p>#DESCRIPTION</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></td></tr></table></body></html>"),
    ResumeTemplate(name: "Template 2",
                   image: UIImage(named: "resume")!,
                   content: "<html><body><table><tr><td><table width=100%><tr><td align=center><h2>#FIRST_NAME #LAST_NAME</h2></td></tr><tr><td align=center>#DEGINATION</td></tr><tr><td align=center>#EMAIL</td></tr><tr><td align=center>#NUMBER</td></tr><tr><td align=center>#ADDRESS</td></tr><tr><td align=center>#PROFILE_LINK</td></tr><tr><td align=center>#LINKEDIN_LINK</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL SUMMARY</u></h3></td></tr><tr><td>#FIRST_NAME is a <b>sophomore</b> at <b>#COLLEGE_NAME</b> majoring in <b>#MAJOR</b> and has <b>#EXP_YEAR years</b> of experience in <b>#ROLE</b>. Committed to delivering high-level solutions that increase business and result in exceptional cost efficiencies and seeking an opportunity where she can apply herself to challenging opportunities in connecting business requirements with Emerging Technologie.</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>EDUCATION</u></h3></td></tr><tr><td><b>#MAJOR</b> #INSTITUTE_NAME</td></tr><tr><td align=right>[#STRT_DATE, #END_DATE]</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>KEY SKILLS</u></h3></td></tr><tr><td>#SKILLS1</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL EXPERIENCE</u></h3></td></tr><tr><td><table width=100%><tr><td><b>#ROLE</b> at #COMPANY_NAME</td></tr><tr><td>[#STRT_DATE, #END_DATE]</td></tr><tr><td><p>#DESCRIPTION</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></td></tr></table></body></html>")
]


