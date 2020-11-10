//
//  ChooseOptionsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/19/20.
//

import UIKit
import GoogleSignIn
import Firebase
import FBSDKLoginKit

class ChooseOptionsViewController: UIViewController, LoginButtonDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var googleSignInButtonOutlet: UIButton!
    @IBOutlet weak var appleSignInButton: UIButton!
    
    //MARK: - Actions
    
    
    @IBAction func googleSignInButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
        
        
        let facebookLoginButton = FBLoginButton()
        facebookLoginButton.center = view.center
        
        
        facebookLoginButton.delegate = self
        facebookLoginButton.permissions = ["public_profile","email"]
        view.addSubview(facebookLoginButton)
        
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        facebookLoginButton.widthAnchor.constraint(equalTo: googleSignInButtonOutlet.widthAnchor).isActive = true
        facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookLoginButton.bottomAnchor.constraint(equalTo: googleSignInButtonOutlet.topAnchor, constant: -10).isActive = true
        facebookLoginButton.topAnchor.constraint(equalTo: appleSignInButton.bottomAnchor, constant: 10).isActive = true
        if let constraint = facebookLoginButton.constraints.first(where: { (constraint) -> Bool in
            return constraint.firstAttribute == .height
        }) {
            constraint.constant = 60.0
        }
        facebookLoginButton.titleLabel?.text = "Sign In with Facebook"
        
        facebookLoginButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        
        googleSignInButtonOutlet.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        
    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start(completionHandler: { conection, result, error in
            print("\(result)")
            if result != nil {
                let collectInformationvc = UIViewController.getFromStoryboard(withId: "CollectInformationViewController") as! CollectInformationViewController
                self.navigationController?.pushViewController(collectInformationvc, animated: true)
            }
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    @objc func didSignIn()  {
        
        // Add your code here to push the new view controller
        let vc = UIViewController.getFromStoryboard(withId: "CollectInformationViewController") as! CollectInformationViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func signInWithEmailClicked(_ sender: Any) {
        let vc = UIViewController.getFromStoryboard(withId: "SignInEmailViewController") as! SignInEmailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
