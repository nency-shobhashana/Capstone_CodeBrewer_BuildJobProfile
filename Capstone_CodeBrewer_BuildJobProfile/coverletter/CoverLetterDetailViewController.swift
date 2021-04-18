//
//  CoverLetterDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/17/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import MaterialComponents.MaterialBottomSheet

class CoverLetterDetailViewController: UIViewController {

    var ref: DatabaseReference!
    var coverLetterTitle: String? = nil
    var resumeData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
