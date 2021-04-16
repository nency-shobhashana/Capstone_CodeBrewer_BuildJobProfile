//
//  ExperianceViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeExperianceViewController: UIViewController {
    
    var experince:[ResumeExperince] = [ResumeExperince(name: "", role: "", startYear: "", endYear: "")]

    @IBOutlet weak var experinceTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        experinceTableView.dataSource = self
    }
    
    @IBAction func addEducationClicked(_ sender: Any) {
        experince.append(ResumeExperince(name: "", role: "", startYear: "", endYear: ""))
        experinceTableView.reloadData()
    }

}

extension ResumeExperianceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experince.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbcell = tableView.dequeueReusableCell(withIdentifier: "ExperianceTableViewCell", for: indexPath) as! ExperianceTableViewCell
        
        let resumeExperince: ResumeExperince = experince[indexPath.row]
        tbcell.initCell(experince: resumeExperince)
        
        return tbcell
    }
    
    
}
