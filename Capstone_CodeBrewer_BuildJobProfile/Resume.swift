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
struct CoverLetterTemplate{
    var name: String
    var image: UIImage
    var content: String
}

let resumeTemplate = [
    ResumeTemplate(name:"Template 1",
                   image: UIImage(named: "resume")!,
                   content: "<html><body><table><tr><table width=100%><tr><td width=70%><h2>#FIRST_NAME #LAST_NAME</h2></td><td width=30% align=right><h3>#DESIGNATION</h3></td></tr><tr><td width=70%>#PROFILE_LINK</td><td width=30% align=right>#EMAIL</td></tr><tr><td width=70%>#LINKEDIN_LINK</td><td width=30% align=right>#NUMBER</td></tr><tr><td width=70%>#ADDRESS</td><td width=30% align=right>&nbsp;</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>PROFESSIONAL SUMMARY</h3></td></tr><tr><td>#PROF_SUMMARY</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>EDUCATION</h3></td></tr><tr><td><table width=100%><tr><td><b>#MAJOR</b>[#START_DATE - #END_DATE]</td></tr><tr><td>#COLLEGE_NAME</td></tr></table></td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3>KEY SKILLS</h3></td></tr><tr><td>#SKILLS</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><h3>PROFESSIONAL EXPERIENCE</h3></td></tr><tr><td><table width=100%><tr><td><b>#ROLE</b>[#EXP_START_DATE - #EXP_END_DATE]</td></tr><tr><td>#COMPANY_NAME</td></tr><tr><td><p>#DESCRIPTION</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></td></tr></table></body></html>"),
    ResumeTemplate(name: "Template 2",
                   image: UIImage(named: "resume")!,
                   content: "<html><body><table width=100%><tr><td><table width=100%><tr><td align=center><h2>#FIRST_NAME #LAST_NAME</h2></td></tr><tr><td align=center>#DEGINATION</td></tr><tr><td align=center>#EMAIL</td></tr><tr><td align=center>#NUMBER</td></tr><tr><td align=center>#ADDRESS</td></tr><tr><td align=center>#PROFILE_LINK</td></tr><tr><td align=center>#LINKEDIN_LINK</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL SUMMARY</u></h3></td></tr><tr><td>#PROF_SUMMARY</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>EDUCATION</u></h3></td></tr><tr><td><b>#MAJOR</b>, #COLLEGE_NAME</td></tr><tr><td align=right>[#STRT_DATE, #END_DATE]</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL EXPERIENCE</u></h3></td></tr><tr><td><table width=100%><tr><td><b>#ROLE</b> at #COMPANY_NAME</td></tr><tr><td>[#EXP_STRT_DATE, #EXP_END_DATE]</td></tr><tr><td><p>#DESCRIPTION</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>KEY SKILLS</u></h3></td></tr><tr><td>#SKILLS1</td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></body></html>")
]

let coverLetterTemplate = [
    CoverLetterTemplate(name: "Post graduate",
                        image: UIImage(named: "coverLetter")!,
                        content: "<html><body><table><tr><table width=100%><tr><td width=70%><h2>#FIRST_NAME #LAST_NAME</h2></td><td width=30% align=right><h3>#DESIGNATION</h3></td></tr><tr><td width=70%>#PROFILE_LINK</td><td width=30% align=right>#EMAIL</td></tr><tr><td width=70%>#LINKEDIN_LINK</td><td width=30% align=right>#NUMBER</td></tr><tr><td width=70%>#ADDRESS</td><td width=30% align=right>&nbsp;</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100><tr><td><b>#EMPLOYEE_NAME</b></td></tr><tr><td>#CAMPNY_NAME</td></tr><tr><td>#EMPLOYEE_ADDRESS</td></tr><tr><td>#EMPLOYEE_CITY</td></tr><tr><td>#EMPLOYEE_EMAIL</td></tr><tr><td>#EMPLOYEE_NUMBER</td></tr><tr>&nbsp;</tr></table></td></tr><tr><td><p>Dear #EMPLOYEE_NAME</p><p>I am writing to apply for the #DESIGNATION job position advertised on #JOB_POST_PLACE. I am a sophomore at #COLLEGE_NAME majoring in #MAJOR and have #EXP_YEAR years of experience in #ROLE.</p><p>I seek to be active in my area of expertise and improve my skills with hard work and dedication. I am looking for a #JOB_TYPE within your organization that would help me demonstrate the abilities I have and contribute to the organization. With a Bachelor’s in Engineering degree in Information Technology and #EXP_YEAR years of experience as a web developer, I believe my skills in #DESIGNATION would make me a positive addition to your team.</p><p>Regarding the Web Developer position currently advertised on Glassdoor, please find attached a copy of my resume for your consideration.</p><p>You can be reached anytime via email at #EMAIL or on my contact number #NUMBER. Please do not hesitate to reach out if you have any questions, and I look forward to the opportunity to speak with you further. Thank you for your time and consideration.</p><p>Yours Sincerely,</p><p>Nency Shobhashana</p></td></tr></body></html>"),
    CoverLetterTemplate(name: "Entry Level",
                        image: UIImage(named: "coverLetter")!,
                        content: "<html><body><table><tr><table width=100%><tr><td width=70%><h2>#FIRST_NAME #LAST_NAME</h2></td><td width=30% align=right><h3>#DESIGNATION</h3></td></tr><tr><td width=70%>#PROFILE_LINK</td><td width=30% align=right>#EMAIL</td></tr><tr><td width=70%>#LINKEDIN_LINK</td><td width=30% align=right>#NUMBER</td></tr><tr><td width=70%>#ADDRESS</td><td width=30% align=right>&nbsp;</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100><tr><td><b>#EMPLOYEE_NAME</b></td></tr><tr><td>#CAMPNY_NAME</td></tr><tr><td>#EMPLOYEE_ADDRESS</td></tr><tr><td>#EMPLOYEE_CITY</td></tr><tr><td>#EMPLOYEE_EMAIL</td></tr><tr><td>#EMPLOYEE_NUMBER</td></tr><tr>&nbsp;</tr></table></td></tr><tr><td><p>Dear #EMPLOYEE_NAME</p><p>I am writing to apply for the #DESIGNATION job position advertised on #JOB_POST_PLACE. I am a sophomore at #COLLEGE_NAME majoring in #MAJOR and have #EXP_YEAR years of experience in #ROLE.</p><p>I seek to be active in my area of expertise and improve my skills with hard work and dedication. I am looking for a #JOB_TYPE within your organization that would help me demonstrate the abilities I have and contribute to the organization. With a Bachelor’s in Engineering degree in Information Technology and #EXP_YEAR years of experience as a web developer, I believe my skills in #DESIGNATION would make me a positive addition to your team.</p><p>Regarding the Web Developer position currently advertised on Glassdoor, please find attached a copy of my resume for your consideration.</p><p>You can be reached anytime via email at #EMAIL or on my contact number #NUMBER. Please do not hesitate to reach out if you have any questions, and I look forward to the opportunity to speak with you further. Thank you for your time and consideration.</p><p>Yours Sincerely,</p><p>Nency Shobhashana</p></td></tr></body></html>")
]


