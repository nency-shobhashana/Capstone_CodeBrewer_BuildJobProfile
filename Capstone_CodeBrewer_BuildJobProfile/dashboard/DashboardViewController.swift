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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resumeCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users").child(Auth.auth().currentUser?.uid ?? "")
        
        resumeCollectionView.dataSource = self
        resumeCollectionView.delegate = self
        resumeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        searchBar.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFirebaseData()
    }
    
    func getFirebaseData(){
        ref.child("resume").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! NSDictionary
                self.resumeCollection.removeAll()
                value.forEach { (key: Any, value: Any) in
                    self.resumeCollection.append(Resume(title: key as! String, image: UIImage(named: "resume")!))
                }
                DispatchQueue.main.async {
                    if self.segmentControl.selectedSegmentIndex == 0 {
                        self.dashboardCollection = self.resumeCollection
                        self.resumeCollectionView.reloadData()
                    }
                }
            }
            else {
                print("No data available")
                DispatchQueue.main.async {
                    self.resumeCollection.removeAll()
                    if self.segmentControl.selectedSegmentIndex == 0 {
                        self.dashboardCollection = self.resumeCollection
                        self.resumeCollectionView.reloadData()
                    }
                }
            }
        }
        ref.child("coverLetter").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as! NSDictionary
                self.coverLetterCollection.removeAll()
                value.forEach { (key: Any, value: Any) in
                    self.coverLetterCollection.append(CoverLetter(title: key as! String, image: UIImage(named: "coverLetter")!))
                }
                DispatchQueue.main.async {
                    if self.segmentControl.selectedSegmentIndex == 1 {
                        self.dashboardCollection = self.coverLetterCollection
                        self.resumeCollectionView.reloadData()
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    self.coverLetterCollection.removeAll()
                    if self.segmentControl.selectedSegmentIndex == 1 {
                        self.dashboardCollection = self.coverLetterCollection
                        self.resumeCollectionView.reloadData()
                    }
                }
                print("No data available")
            }
        }
    }
    
    func removeData(isResume: Bool, title: String){
        let refreshAlert = UIAlertController(title: "Delete", message: "Are you sure you want to remove?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Remove", style: .default, handler: { (action: UIAlertAction!) in
            if isResume {
                self.ref.child("resume").child(title).removeValue()
            } else {
                self.ref.child("coverLetter").child(title).removeValue()
            }
            self.getFirebaseData()
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logout", sender: nil)
        } catch let error as NSError {
            print(error)
        }
    }
    
    // segment of resume and cover letter
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        searchBar.text = ""
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
        let lastIndex: Int = resumeCollection.map { (resume) -> Int in
            let sub:String = resume.title[7..<resume.title.count]
            return Int(sub) ?? 0
        }.max() ?? 0
        performSegue(withIdentifier: "resumeBuilder", sender: "resume_\(lastIndex + 1)")
    }
    
    func openCoverBuilder(){
        let lastIndex: Int = coverLetterCollection.map { (cover) -> Int in
            let sub:String = cover.title[6..<cover.title.count]
            return Int(sub) ?? 0
        }.max() ?? 0
        performSegue(withIdentifier: "coverBuilder", sender: "cover_\(lastIndex + 1)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "choicePopup"{
            let choiceVC = segue.destination as! AddNewPopUoViewController
            choiceVC.dashBoardVC = self
        }
        if segue.identifier == "resumeBuilder"{
            let choiceVC = segue.destination as! ResumeDetailViewController
            choiceVC.resumeTitle = sender as? String
        }
        if segue.identifier == "coverBuilder"{
            let choiceVC = segue.destination as! CoverLetterDetailViewController
            choiceVC.coverLetterTitle = sender as? String
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
        cell.dashboardViewController = self
        cell.setup(with: dashboardCollection[indexPath.row], isResume: self.segmentControl.selectedSegmentIndex == 0)
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
        if self.segmentControl.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "resumeBuilder", sender: dashboardCollection[indexPath.row].title)
        } else {
            performSegue(withIdentifier: "coverBuilder", sender: dashboardCollection[indexPath.row].title)
        }
    }
}

extension DashboardViewController: UISearchBarDelegate {
    // search on search button clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == nil || searchBar.text == "" {
            searchBarCancelButtonClicked(searchBar)
        }
        var sourceCollection: [DataCollection]
        if segmentControl.selectedSegmentIndex == 0{
            sourceCollection = resumeCollection
        } else {
            sourceCollection = coverLetterCollection
        }
        dashboardCollection = sourceCollection.filter({ data -> Bool in
            data.title.lowercased().contains(searchBar.text?.lowercased() ?? "")
        })
        resumeCollectionView.reloadData()
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if segmentControl.selectedSegmentIndex == 0 {
            dashboardCollection = resumeCollection
        } else {
            dashboardCollection = coverLetterCollection
        }
        resumeCollectionView.reloadData()
        searchBar.endEditing(true)
    }
}
extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
