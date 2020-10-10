//
//  WelcomeViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/19/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    
    //MARK: - Outlets
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    //MARK: - Actions
    @IBAction func CreateAnAccountAction(_ sender: Any) {
        let chooseOtionViewController = UIViewController.getFromStoryboard(withId: "ChooseOptionsViewController")
        navigationController?.pushViewController(chooseOtionViewController!, animated: true)
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        signInButton.layer.cornerRadius = 20
        createAccountButton.layer.cornerRadius = 20
        super.viewDidLoad()
    }

}
