//
//  ChangeJobsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/28/20.
//

import UIKit

class ChangeJobsViewController: UIViewController {

    @IBOutlet weak var jobTitleOutlet: UITextField!
    @IBOutlet weak var jobSalaryOutlet: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobTitleOutlet.attributedPlaceholder = NSAttributedString(string:"Name of the job", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        jobSalaryOutlet.attributedPlaceholder = NSAttributedString(string:"Salary", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        saveButtonOutlet.layer.cornerRadius = 20
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
