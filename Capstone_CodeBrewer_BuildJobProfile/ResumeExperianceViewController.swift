//
//  ExperianceViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeExperianceViewController: UIViewController, MDCBottomSheetMethod  {
    
    var experience:[ResumeExperience]!

    weak var resumeDetailVC: ResumeDetailViewController!
    
    @IBOutlet weak var experinceTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        experience = (resumeDetailVC.resumeData["experience"] as? Array<ResumeExperience>) ?? [ResumeExperience(name: "", role: "", startYear: "", endYear: "")]
        experinceTableView.dataSource = self
    }
    
    func onDismiss() {
        resumeDetailVC.resumeData["experience"] = experience
    }
    
    @IBAction func addEducationClicked(_ sender: Any) {
        experience.append(ResumeExperience(name: "", role: "", startYear: "", endYear: ""))
        experinceTableView.reloadData()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        resumeDetailVC.resumeSkilsClicked(sender)
    }

}

extension ResumeExperianceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experience.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbcell = tableView.dequeueReusableCell(withIdentifier: "ExperianceTableViewCell", for: indexPath) as! ExperianceTableViewCell
        
        let resumeExperince: ResumeExperience = experience[indexPath.row]
        tbcell.initCell(experince: resumeExperince)
        
        return tbcell
    }
    
    
}
