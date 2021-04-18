//
//  CoverLetterChooseTemplateViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/18/21.
//

import UIKit

class CoverLetterChooseTemplateViewController: UIViewController {

    @IBOutlet weak var templateCollectionView: UICollectionView!
    
    var coverLetterTitle: String? = nil
    var coverLetterData: Dictionary<String, Any>!
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
        if segue.identifier == "CoverLetterPreview" {
            let vc = (segue.destination as! CoverLetterSaveViewController)
             vc.templateIndex = sender as? Int ?? 0
            vc.coverLetterTitle = self.coverLetterTitle
            vc.coverLetterData = self.coverLetterData
        }
    }
    
}
// Show cover letter List
extension CoverLetterChooseTemplateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverLetterTemplate.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoverLetterChooseTemplateCollectionViewCell", for: indexPath) as! CoverLetterChooseTemplateCollectionViewCell
        cell.setup(with: coverLetterTemplate[indexPath.row])
        return cell
    }
}

extension CoverLetterChooseTemplateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension CoverLetterChooseTemplateViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CoverLetterPreview", sender: indexPath.row)
    }
}

