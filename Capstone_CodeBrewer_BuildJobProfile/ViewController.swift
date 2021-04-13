//
//  ViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 2021-04-12.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    
    // Delegate method of facebook
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error as Any)
            return
        } else {
            print("Login successfully with Facebook")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did Logout od Facebook")
    }
    
    
    @IBOutlet var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase google sign up
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            // Signed In
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        //Firebase facebook sign up
        let loginButton = FBLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 48, height: 50)
        loginButton.delegate = self
    }


}

