//
//  CoverLetterDetailViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/17/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FittedSheets

class CoverLetterDetailViewController: UIViewController  {

    @IBOutlet weak var nextButton: UIButton!
    var bottomSheet:SheetViewController? = nil
    var ref: DatabaseReference!
    var coverLetterTitle: String? = nil
    var coverLetterData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("users/\(Auth.auth().currentUser?.uid ?? "")/coverLetter")
        retrieveCoverLetterDetail()
        nextButton.isEnabled = false
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
                if self.isImpDataThere() {
                    DispatchQueue.main.async {
                        self.nextButton.isEnabled = true
                    }
                }
            }
            else {
                self.coverLetterData = Dictionary<String, Any>()
            }
        }
    }
    
    func isImpDataThere() -> Bool {
        return (coverLetterData["firstName"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false &&
            (coverLetterData["lastName"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false &&
            (coverLetterData["email"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["phone"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["college_name"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["major"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["employee_cmpny_address"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["employee_email"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["employee_number"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
            (coverLetterData["job_post"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
    }
    
    func saveDataOnSheetDismiss() {
        if coverLetterTitle != nil  && isImpDataThere() {
            ref.child(coverLetterTitle!).setValue(coverLetterData)
            nextButton.isEnabled = true
        }
        bottomSheet = nil
    }
    

    // MARK: - Cover Letter Detail
    @IBAction func personalClicked(_ sender: Any) {
        bottomSheet?.dismiss(animated: true, completion: nil)
        let bottomSheetVC = self.storyboard!.instantiateViewController(withIdentifier: "CoverLetterFieldFormViewController") as! CoverLetterFieldFormViewController
        bottomSheetVC.coverLetterDetailVC = self
        bottomSheet = SheetViewController(controller: bottomSheetVC, sizes: [.percent(0.5), .fullscreen])
        bottomSheet?.minimumSpaceAbovePullBar = 24
        bottomSheet?.shouldDismiss = { sheet in
            (sheet.childViewController as? MDCBottomSheetMethod)?.onDismiss()
            self.saveDataOnSheetDismiss()
            return true
        }
        self.present(bottomSheet!, animated: true, completion: nil)
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
