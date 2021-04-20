//
//  ResumeEducationViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit

class ResumeEducationViewController: UIViewController, MDCBottomSheetMethod {
    
    var education:[ResumeEducation]!
    
    weak var resumeDetailVC: ResumeDetailViewController!
    
    @IBOutlet weak var educationTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sheetViewController!.handleScrollView(self.educationTableView)
        
        // Do any additional setup after loading the view.
        education = (resumeDetailVC.resumeData["education"] as? Array<Dictionary<String, String>>)?.map({ (data) -> ResumeEducation in
            return ResumeEducation(name: data["name"] ?? "", major: data["major"] ?? "", startYear: data["startYear"] ?? "", endYear: data["endYear"] ?? "")
            
        }) ?? [ResumeEducation(name: "", major: "", startYear: "", endYear: "")]
        educationTableView.dataSource = self
    }
    
    //MARK: - For hiding keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @IBAction func addEducationClicked(_ sender: Any) {
        education.append(ResumeEducation(name: "", major: "", startYear: "", endYear: ""))
        educationTableView.reloadData()
    }
    
    func onDismiss() {
        educationTableView.visibleCells.forEach { cell in
            if let data = (cell as! EducationTableViewCell).saveData() {
                education[(cell as! EducationTableViewCell).index] = data
            }
            
        }
        resumeDetailVC.resumeData["education"] = education.map({ (data) -> Dictionary<String, String> in
            ["name" : data.name, "major" : data.major, "startYear" : data.startYear, "endYear": data.endYear]
        })
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
        
        if let data = tbcell.saveData() {
            education[tbcell.index] = data
        }
        tbcell.initCell(education: education[indexPath.row], index: indexPath.row)
        
        return tbcell
    }
}
