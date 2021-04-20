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
        
        self.sheetViewController!.handleScrollView(self.experinceTableView)

        // Do any additional setup after loading the view.
        experience = (resumeDetailVC.resumeData["experience"] as? Array<Dictionary<String, String>>)?.map({ (data) -> ResumeExperience in
                    return ResumeExperience(name: data["name"] ?? "", role: data["role"] ?? "", startYear: data["startYear"] ?? "", endYear: data["endYear"] ?? "", description: data["description"] ?? "")
                    
                }) ?? [ResumeExperience(name: "", role: "", startYear: "", endYear: "", description: "")]

        experinceTableView.dataSource = self
    }
    
    //MARK: - For hiding keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    func onDismiss() {
        experinceTableView.visibleCells.forEach { cell in
                    if let data = (cell as! ExperianceTableViewCell).saveData() {
                        experience[(cell as! ExperianceTableViewCell).index] = data
                    }
                    
                }
                resumeDetailVC.resumeData["experience"] = experience.map({ (data) -> Dictionary<String, String> in
                    ["name" : data.name, "role" : data.role, "startYear" : data.startYear, "endYear": data.endYear, "description" : data.description]
                })
    }
    
    @IBAction func addEducationClicked(_ sender: Any) {
        experience.append(ResumeExperience(name: "", role: "", startYear: "", endYear: "", description: ""))
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
        
        if let data = tbcell.saveData() {
                    experience[tbcell.index] = data
                }
                
                tbcell.initCell(experince: experience[indexPath.row], index: indexPath.row)
        
        return tbcell
    }
}
