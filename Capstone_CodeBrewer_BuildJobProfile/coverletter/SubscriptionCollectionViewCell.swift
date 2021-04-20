//
//  SubscriptionCollectionViewCell.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import MaterialComponents.MaterialCards
import MaterialComponents.MaterialCards_Theming

class SubscriptionCollectionViewCell: UICollectionViewCell {
    
    weak var subscriptionViewController: SubscriptionViewController!
    
    @IBOutlet weak var cardView: MDCCard!
    @IBOutlet weak var planNameTF: UITextField!
    @IBOutlet weak var planPriceTF: UITextField!
    @IBOutlet weak var planDescTF: UITextField!
    
    var data: Subscription? = nil
    var dataIndex: Int = -1
    
    func setupCell(with data: Subscription, index: Int){
        let containerScheme = MDCContainerScheme()
        cardView.applyTheme(withScheme: containerScheme)
        self.data = data
        self.dataIndex = index
        planNameTF.text = data.planName
        planPriceTF.text = "$\(data.plantPrice) / \(data.isMonthly ? "Month" : "Year")"
        planDescTF.text = data.planDescription
    }
    
    @IBAction func buyClicked(_ sender: Any) {
        subscriptionViewController.subscripationSelected(index: self.dataIndex)
    }
}
