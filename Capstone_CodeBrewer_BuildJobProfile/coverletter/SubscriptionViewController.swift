//
//  SubscriptionViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import PassKit
import FirebaseAuth
import FirebaseDatabase

class SubscriptionViewController: UIViewController {
    
    var ref: DatabaseReference!
    private var paymentRequest: PKPaymentRequest = {
            let request = PKPaymentRequest()
        request.merchantIdentifier = ""
        request.supportedNetworks = [.quicPay, .visa
                                     , .amex, .masterCard]
        request.supportedCountries = ["CA", "US"]
        request.merchantCapabilities = .capability3DS
        request.countryCode = "CA"
        request.currencyCode = "CAD"
        
        return request
    }()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        ref = Database.database().reference().child("users").child(Auth.auth().currentUser?.uid ?? "")
        // Do any additional setup after loading the view.
    }
    
    var subscriptionPurchasing = -1
    
    func subscripationSelected(index: Int){
        paymentRequest.paymentSummaryItems = [PKPaymentSummaryItem(label: subscription[index].planName, amount: NSDecimalNumber(value: subscription[index].plantPrice))]
        
        let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
        if controller != nil{
            controller!.delegate = self
            present(controller!, animated: true) {
                self.subscriptionPurchasing = index
            }
        }
    }
    func subscriptionPurchased(index: Int, completion: @escaping (PKPaymentAuthorizationResult) -> Void){
        var data:Dictionary<String, Any> = ["purchaseDate": ""]
        
        ref.child("subscription").getData { (error, snapshot) in
            if let error = error {
                completion(PKPaymentAuthorizationResult(status: .failure, errors: nil))
                print("Error getting data \(error)")
                return
            }
            else if snapshot.exists() {
                let value = snapshot.value as! Dictionary<String, Any>
                let noOfLetter = value["noOfLetter"] as! NSNumber
                data["noOfLetter"] = Int(truncating: noOfLetter) + subscription[index].noOfLetter
            }
            else {
                data["noOfLetter"] = subscription[index].noOfLetter
            }
            self.ref.child("subscription").setValue(data, withCompletionBlock: { (error, ref) in
                if let error = error {
                    completion(PKPaymentAuthorizationResult(status: .failure, errors: nil))
                } else {
                    completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
                }
            })
        }
    }

}

extension SubscriptionViewController : PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true) {
            self.subscriptionPurchasing = -1
        }
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        self.subscriptionPurchased(index: self.subscriptionPurchasing, completion: completion)
    }
}

// Show resume List
extension SubscriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subscription.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionCollectionViewCell", for: indexPath) as! SubscriptionCollectionViewCell
        cell.subscriptionViewController = self
        cell.setupCell(with: subscription[indexPath.row], index: indexPath.row)
        return cell
    }
}

extension SubscriptionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}


