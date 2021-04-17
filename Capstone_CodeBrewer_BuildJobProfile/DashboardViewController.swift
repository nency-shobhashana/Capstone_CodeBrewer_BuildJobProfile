//
//  DashboardViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 14/04/21.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var resumeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resumeCollectionView.dataSource = self
        resumeCollectionView.delegate = self
        resumeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    // segment of resume and cover letter
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Resume
            
        } else {
            // Cover Letter
        }
    }
}

// Show resume List
extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resumes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResumeCollectionViewCell", for: indexPath) as! ResumeCollectionViewCell
        cell.setup(with: resumes[indexPath.row])
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
        print(resumes[indexPath.row].title)
    }
}
