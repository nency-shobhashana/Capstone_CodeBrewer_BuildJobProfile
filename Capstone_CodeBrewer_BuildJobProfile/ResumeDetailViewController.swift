//
//  ResumeDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/15/21.
//

import UIKit

class ResumeDetailViewController: UIViewController {

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
    
    @IBAction func personalClicked(_ sender: Any) {
        addProfileVCInBottonSheet()
    }
    
    func addProfileVCInBottonSheet() {
            // 1- Init bottomSheetVC
            let bottomSheetVC =
            self.storyboard!.instantiateViewController(withIdentifier: "ResumePersonalViewController") as!
                ResumePersonalViewController

            // 2- Add bottomSheetVC as a child view
            self.addChild(bottomSheetVC)
            self.view.addSubview(bottomSheetVC.view)
            bottomSheetVC.didMove(toParent: self)

            // 3- Adjust bottomSheet frame and initial position.
            let height = view.frame.height
            let width  = view.frame.width
            bottomSheetVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
        }
}
