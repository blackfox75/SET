//
//  CollectInformationViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/20/20.
//

import UIKit
import GoogleSignIn

class CollectInformationViewController: UIViewController {
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.value(forKeyPath: "Email") as! String == "smalz4282@gmail.com") {
            print("Horray!")
        } else {
            print("Nope!")
        }
        
        for elem in UserDefaults.standard.dictionaryRepresentation().values {
            print("\(elem) popka")
        }
    }

    @IBAction func startNowClicked(_ sender: Any) {
        let jobsVC = UIViewController.getFromStoryboard(withId: "jobsQuestionViewController") as! JobsQuestionViewController
        navigationController?.pushViewController(jobsVC, animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
