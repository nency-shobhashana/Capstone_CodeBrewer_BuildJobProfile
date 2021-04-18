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

class CoverLetterDetailViewController: UIViewController, MDCBottomSheetControllerDelegate  {

    var bottomSheet:MDCBottomSheetController? = nil
    var ref: DatabaseReference!
    var coverLetterTitle: String? = nil
    var coverLetterData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("users/\(Auth.auth().currentUser?.uid ?? "")/coverLetter")
        retrieveCoverLetterDetail()
    }
    
    // retrieve coverLetter Detail
    func retrieveCoverLetterDetail(){
        ref.child(coverLetterTitle!).getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! Dictionary<String, Any>
                self.coverLetterData = value
            }
            else {
                self.coverLetterData = Dictionary<String, Any>()
            }
        }
    }
    
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        (controller.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        if coverLetterTitle != nil{
            ref.child(coverLetterTitle!).setValue(coverLetterData)
        }
        bottomSheet = nil
    }
    

    // MARK: - Cover Letter Detail
    @IBAction func personalClicked(_ sender: Any) {
        (bottomSheet?.contentViewController as? MDCBottomSheetMethod)?.onDismiss()
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "CoverLetterFieldFormViewController") as! CoverLetterFieldFormViewController
        bottomSheetVC.coverLetterDetailVC = self
        bottomSheet = MDCBottomSheetController(contentViewController: bottomSheetVC)
        present(bottomSheet!,animated: true, completion: nil)
        bottomSheet?.delegate = self
    }
    
    // MARK: - choose template navigation
    @IBAction func nextClicked(_ sender: Any) {
        performSegue(withIdentifier: "CoverLetterTemplateChoose", sender: coverLetterTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CoverLetterTemplateChoose"{
            let vc = (segue.destination as! CoverLetterChooseTemplateViewController)
            vc.coverLetterTitle = self.coverLetterTitle
            vc.coverLetterData = self.coverLetterData
            
        }
    }

}
