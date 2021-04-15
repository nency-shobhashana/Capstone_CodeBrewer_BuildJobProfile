//
//  DashboardViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Archit Sureja on 14/04/21.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var resumeCollectionView: UICollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.dataSource = self
        
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Resume
            
        } else {
            // Cover Letter
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resumes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResumeCollectionViewCell, for: indexPath) as! ResumeCollectionViewCell
        
        return cell
    }
}
