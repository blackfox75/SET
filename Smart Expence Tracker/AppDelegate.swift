//
//  AppDelegate.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/19/20.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
//import RealmSwift

@main class AppDelegate: UIResponder, UIApplicationDelegate , GIDSignInDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.clientID = "70917760931-nthr9bkl8069990mum6hhdh19ug2cthe.apps.googleusercontent.com"
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        if (error == nil) {
              // Perform any operations on signed in user here.
            print(user.profile.email!)
            //try
            let defaults = UserDefaults.standard
            defaults.set(user.profile.email, forKey: "Email")
            defaults.set(user.profile.name, forKey: "Name")
            //try
            print("Error:", error.debugDescription)
        guard let authentication = user.authentication else { return }
           let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
           NotificationCenter.default.post(
               name: Notification.Name("SuccessfulSignInNotification"), object: nil, userInfo: nil)
            } else {

              print("\(error.localizedDescription)")
            }
//                print("User email: \(user.profile.email ?? "No Email")")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
        
        return GIDSignIn.sharedInstance().handle(url)
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


}
