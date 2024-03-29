//
//  ResumeSkilsViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import MaterialComponents.MaterialChips
import MaterialComponents.MaterialContainerScheme
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialChips_Theming

class ResumeSkilsViewController: UIViewController, MDCChipFieldDelegate, MDCBottomSheetMethod  {
    
    var containerScheming: MDCContainerScheming = MDCContainerScheme()
    let chipField = MDCChipField()
    weak var resumeDetailVC: ResumeDetailViewController!
    
    @IBOutlet weak var chipFieldView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sheetViewController!.handleScrollView(self.scrollView)
        
        // Do any additional setup after loading the view.
        (resumeDetailVC.resumeData["skills"] as? String)?.components(separatedBy: ",").forEach({ (string) in
            let view = MDCChipView()
            view.titleLabel.text = string
            chipField.addChip(view)
        })
    }
    
    //MARK: - For hiding keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    func onDismiss() {
        resumeDetailVC.resumeData["skills"] = chipField.chips.map({ (chipView) -> String in
            return chipView.titleLabel.text ?? ""
        }).joined(separator: ",")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTextField()
    }
    
    private func configTextField(){
        
        chipField.delegate = self
        chipField.textField.placeholderLabel.text = "Enter your skills."
        chipField.backgroundColor = containerScheming.colorScheme.surfaceColor
        chipField.showChipsDeleteButton = true
        chipField.frame = chipFieldView.frame
        chipFieldView.addSubview(chipField)
    }
    
    func chipFieldHeightDidChange(_ chipField: MDCChipField) {
        chipFieldView.layoutIfNeeded()
    }
    
    func chipField(_ chipField: MDCChipField, didAddChip chip: MDCChipView) {
        chip.applyTheme(withScheme: containerScheming)
        chip.sizeToFit()
        let chipVerticalInset = min(0, chip.bounds.height - 48 / 2)
        chip.hitAreaInsets = UIEdgeInsets(top: chipVerticalInset, left: 0, bottom: chipVerticalInset, right: 0)
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        resumeDetailVC.bottomSheet?.attemptDismiss(animated: true)
    }
}

extension ResumeSkilsViewController {
    @objc class func catalogMetadata() -> [String: Any] {
        return [
            "breadcrumbs" : ["Chips", "Chips Input Delete Enabled (Swift)"],
            "primaryDemo" : false,
            "presentable" : false,
        ]
    }
}
