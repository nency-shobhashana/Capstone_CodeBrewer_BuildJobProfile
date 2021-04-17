//
//  AppDelegate.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 2021-04-12.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        // Firebase google signup
        GIDSignIn.sharedInstance()?.clientID = "402578668828-oe7pr8d0a5vqg7hdmlsiphop3cpdthmv.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        // Firebase facebook signup
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // ...
          if let error = error {
            // ...
            return
          }

          guard let authentication = user.authentication else { return }
          let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                            accessToken: authentication.accessToken)
        
        print("User email: \(user.profile.email ?? "No email")")
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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // For Google Signup
        if GIDSignIn.sharedInstance().handle(url) {
            return true
        }
        
        // For Facebook Signup
        if ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.sourceApplication]) {
            return true
        }
        
        return false

    }
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    //core data persistentContainer
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "resumeData")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    lazy var coreDataContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}

