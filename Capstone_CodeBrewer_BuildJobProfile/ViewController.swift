//
//  ViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 2021-04-12.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            // Signed In
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }


}

