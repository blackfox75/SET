//
//  jbosQuestionViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/21/20.
//

import UIKit

class JobsQuestionViewController: UIViewController {

    @IBOutlet weak var firstQuestionTextOutlet: UILabel!
    @IBOutlet weak var secondQuestionTextOutlet: UILabel!
    @IBOutlet weak var firsttextFieldOutlet: UITextField!
    @IBOutlet weak var secondTextFieldOutlet: UITextField!
    @IBOutlet weak var thirdTextFieldOutlet: UITextField!
    @IBOutlet weak var congratulationsMessageOutlet: UILabel!
    @IBOutlet weak var circleImageOutlet: UIImageView!
    @IBOutlet weak var buttonTextOutlet: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var cirlceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cirlceButton.layer.cornerRadius = 20
        circleView.layer.cornerRadius = 20
        firstQuestionTextOutlet.text = "How many jobs do you have?"
        firsttextFieldOutlet.isHidden = false
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
    }
    
}
