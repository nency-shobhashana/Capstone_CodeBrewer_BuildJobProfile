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

class ResumeSkilsViewController: UIViewController, MDCChipFieldDelegate {
    
    var containerScheming: MDCContainerScheming = MDCContainerScheme()
        
    @IBOutlet weak var chipFieldView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTextField()
    }
    
    private func configTextField(){
        let chipField = MDCChipField()
        
        chipField.delegate = self
        chipField.textField.placeholderLabel.text = "Enter your skills."
        chipField.backgroundColor = containerScheming.colorScheme.surfaceColor
        chipField.showChipsDeleteButton = true
        chipField.frame = chipFieldView.frame
        chipFieldView.addSubview(chipField)
    }
    
    func chipFieldHeightDidChange(_ chipField: MDCChipField) {
        view.layoutIfNeeded()
    }
    
    func chipField(_ chipField: MDCChipField, didAddChip chip: MDCChipView) {
        chip.applyTheme(withScheme: containerScheming)
        chip.sizeToFit()
        let chipVerticalInset = min(0, chip.bounds.height - 48 / 2)
        chip.hitAreaInsets = UIEdgeInsets(top: chipVerticalInset, left: 0, bottom: chipVerticalInset, right: 0)
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
