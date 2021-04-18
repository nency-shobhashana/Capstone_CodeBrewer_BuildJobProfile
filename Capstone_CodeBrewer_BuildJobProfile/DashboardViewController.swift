//
//  DashboardViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 14/04/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class DashboardViewController: UIViewController {
    
    var ref: DatabaseReference!
    var resumeCollection: [Resume] = []
    var coverLetterCollection: [CoverLetter] = []
    var dashboardCollection: [DataCollection] = []

    @IBOutlet weak var resumeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users").child(Auth.auth().currentUser?.uid ?? "")
        getFirebaseData()
        
        resumeCollectionView.dataSource = self
        resumeCollectionView.delegate = self
        resumeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func getFirebaseData(){
        ref.child("resume").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! NSDictionary
                value.forEach { (key: Any, value: Any) in
                    self.resumeCollection.append(Resume(title: key as! String, image: UIImage(named: "resume")!))
                }
            }
            else {
                print("No data available")
            }
        }
        ref.child("coverLetter").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! NSDictionary
                value.forEach { (key: Any, value: Any) in
                    self.coverLetterCollection.append(CoverLetter(title: key as! String, image: UIImage(named: "coverLetter")!))
                }
            }
            else {
                print("No data available")
            }
        }
    }
    
    // segment of resume and cover letter
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // resume
            dashboardCollection = resumeCollection
            
        } else {
            // Cover Letter
            dashboardCollection = coverLetterCollection
        }
        resumeCollectionView.reloadData()
    }
    
    func openResumeBuilder(){
        performSegue(withIdentifier: "resumeBuilder", sender: self)
    }
    
    func openCoverBuilder(){
        performSegue(withIdentifier: "coverBuilder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "choicePopup"{
            let choiceVC = segue.destination as! AddNewPopUoViewController
            choiceVC.dashBoardVC = self
        }
    }
}

// Show resume List
extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashboardCollection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResumeCollectionViewCell", for: indexPath) as! ResumeCollectionViewCell
        cell.setup(with: dashboardCollection[indexPath.row])
        return cell
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dashboardCollection[indexPath.row].title)
    }
}
