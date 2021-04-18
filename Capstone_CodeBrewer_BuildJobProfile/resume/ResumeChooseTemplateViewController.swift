//
//  ResumeChooseTemplateViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeChooseTemplateViewController: UIViewController {

    @IBOutlet weak var templateCollectionView: UICollectionView!
    
    var resumeTitle: String? = nil
    var resumeData: Dictionary<String, Any>!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        templateCollectionView.dataSource = self
        templateCollectionView.delegate = self
        templateCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResumePreview" {
            let vc = (segue.destination as! ResumeSaveDownloadViewController)
             vc.templateIndex = sender as? Int ?? 0
            vc.resumeTitle = self.resumeTitle
            vc.resumeData = self.resumeData
        }
    }
    
}
// Show resume List
extension ResumeChooseTemplateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resumeTemplate.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResumeChooseTemplateCollectionViewCell", for: indexPath) as! ResumeChooseTemplateCollectionViewCell
        cell.setup(with: resumeTemplate[indexPath.row])
        return cell
    }
}

extension ResumeChooseTemplateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension ResumeChooseTemplateViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ResumePreview", sender: indexPath.row)
    }
}
