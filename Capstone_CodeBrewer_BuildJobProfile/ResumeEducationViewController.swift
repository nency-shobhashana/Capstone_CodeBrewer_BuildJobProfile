//
//  ResumeEducationViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeEducationViewController: UIViewController {
    
    var education:[ResumeEducation] = [ResumeEducation(name: "", major: "", startYear: "", endYear: "")]
    
    weak var resumeDetailVC: ResumeDetailViewController!
    weak var resumeData: ResumeDetail!
    
        @IBOutlet weak var educationTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                educationTableView.dataSource = self
    }
    
    @IBAction func addEducationClicked(_ sender: Any) {
            education.append(ResumeEducation(name: "", major: "", startYear: "", endYear: ""))
            educationTableView.reloadData()
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func nextClicked(_ sender: Any) {
        resumeDetailVC.resumeExperinceClicked(sender)
    }

}

extension ResumeEducationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return education.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbcell = tableView.dequeueReusableCell(withIdentifier: "EducationTableViewCell", for: indexPath) as! EducationTableViewCell
        
        let resumeEducation: ResumeEducation = education[indexPath.row]
        tbcell.initCell(education:resumeEducation)
        
        return tbcell
    }
    
    
}
