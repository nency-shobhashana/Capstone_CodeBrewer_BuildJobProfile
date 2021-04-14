//
//  LoginAuthViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 2021-04-13.
//

import UIKit
import LocalAuthentication

class LoginAuthViewController: UIViewController {
    
    @IBOutlet weak var authBtn: UIButton!
    
    let context = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.authIdentify()
    }
    
    @IBAction func authBtnTapped(_ sender: UIButton) {
        self.authIdentify()
    }
    
    func authIdentify() {
        var error:NSError?
        
        guard self.context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return print(error!)
        }
        if self.context.biometryType == .faceID {
           // Face Id
            print("Face Id")
            self.authBtn.setImage(UIImage(named: "face"), for: .normal)
        } else if self.context.biometryType == .touchID {
            // Touch Id
            print("Touch Id")
            self.authBtn.setImage(UIImage(named: "bio"), for: .normal)
        } else {
            // None
            print("None")
        }
        
        let reason = "Identify yourselt to countinue application"
        
        self.context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: reason) { (isSuccess, error) in
            if isSuccess {
                //Success
                print("Success")
            }else{
                //Error
                showLAError(laError: error!)
            }
        }
        
        // function to detect an error type
        func showLAError(laError: Error) -> Void {
            var message = ""
            switch laError {
            case LAError.appCancel:
                message = "Authentication was cancelled by application"
            case LAError.authenticationFailed:
                message = "The user failed to provide valid credentials"
            case LAError.invalidContext:
                message = "The context is invalid"
            case LAError.passcodeNotSet:
                message = "Passcode is not set on the device"
            case LAError.systemCancel:
                message = "Authentication was cancelled by the system"
            case LAError.biometryLockout:
                message = "Too many failed attempts."
                case LAError.biometryNotAvailable:
                message = "TouchID is not available on the device"
            case LAError.userCancel:
                message = "The user did cancel"
            case LAError.userFallback:
                message = "The user chose to use the fallback"
            default:
                if #available(iOS 11.0, *) {
                    switch laError {
                    case LAError.biometryNotAvailable:
                        message = "Biometry is not available"
                    case LAError.biometryNotEnrolled:
                        message = "Authentication could not start, because biometry has no enrolled identities"
                    case LAError.biometryLockout:
                        message = "Biometry is locked. Use passcode."
                    default:
                        message = "Did not find error code on LAError object"
                    }
                }else{
                    message = "Did not find error code on LAError object"
                }
            }
            //return message
            print("LAError message - \(message)")
        }

    }

}
