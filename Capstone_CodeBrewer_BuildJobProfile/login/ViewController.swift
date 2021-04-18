//
//  ViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 2021-04-12.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FirebaseAuth


class ViewController: UIViewController, LoginButtonDelegate {
    
    var handler: AuthStateDidChangeListenerHandle? = nil
    
    //Delegate method of facebook
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error as Any)
            return
        } else {
            if result?.isCancelled != false {
                return
            }
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            Auth.auth().signIn(with: credential){ (authResult, error) in
                if let error = error {
                    let authError = error as NSError
                    print(error.localizedDescription)
                    return
                }
                guard let uid = authResult?.user.uid else { return }
                print(uid)
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did Logout od Facebook")
    }
    
    
    @IBOutlet weak var fbLoginPlace: FBLoginButton!
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        handler = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "bioAuth", sender: nil)
            }
        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
//        let fbLoginButton = FBLoginButton()
//        fbLoginButton.center.x = fbLoginPlace.center.x
//        fbLoginPlace.addSubview(fbLoginButton)
        
        //Firebase facebook sign up
        fbLoginPlace.delegate = self
        fbLoginPlace.permissions = ["public_profile", "email"]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if handler != nil{
            Auth.auth().removeStateDidChangeListener(handler!)
        }
    }
    
    
}

