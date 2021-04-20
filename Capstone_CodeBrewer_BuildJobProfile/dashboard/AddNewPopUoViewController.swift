//
//  AddNewPopUoViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/17/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddNewPopUoViewController: UIViewController {
    
    weak var dashBoardVC: DashboardViewController!
    var ref: DatabaseReference!
    
    @IBOutlet weak var coverLetter: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        coverLetter.isEnabled = false
        ref = Database.database().reference().child("users").child(Auth.auth().currentUser?.uid ?? "")
        ref.child("subcription").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
                return
            }
            else if snapshot.exists() {
                let value = snapshot.value as! Dictionary<String, Any>
                let noOfLetter = value["noOfLetter"] as! NSNumber
                if Int(truncating: noOfLetter) > 0{
                    self.coverLetter.isEnabled = true
                }
            }
        }
        
    }
    
    @IBAction func newResumeClicked(_ sender: Any) {
        dashBoardVC.openResumeBuilder()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func newCoverletterClicked(_ sender: Any) {
        dashBoardVC.openCoverBuilder()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func subscriptionClicked(_ sender: Any) {
        dashBoardVC.openSubscription()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
