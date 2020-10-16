//
//  CollectInformationViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/20/20.
//

import UIKit

class CollectInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startNowClicked(_ sender: Any) {
        let jobsVC = UIViewController.getFromStoryboard(withId: "jobsQuestionViewController") as! JobsQuestionViewController
        navigationController?.pushViewController(jobsVC, animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
