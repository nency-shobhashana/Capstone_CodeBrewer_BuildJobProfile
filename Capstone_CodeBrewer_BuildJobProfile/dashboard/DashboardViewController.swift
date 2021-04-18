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
                value.forEach { (key: Any, value: Any) in
                    self.resumeCollection.removeAll()
                    self.resumeCollection.append(Resume(title: key as! String, image: UIImage(named: "resume")!))
                    self.dashboardCollection = self.resumeCollection
                    DispatchQueue.main.async {
                        self.resumeCollectionView.reloadData()
                    }
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
                    self.coverLetterCollection.removeAll()
                    self.coverLetterCollection.append(CoverLetter(title: key as! String, image: UIImage(named: "coverLetter")!))
                }
            }
            else {
                print("No data available")
            }
        }
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
        if true {
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
