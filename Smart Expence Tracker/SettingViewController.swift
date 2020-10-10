//
//  SettingViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/27/20.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
    }
    
    @IBAction func profileClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        self.present(controller, animated: true, completion: nil)
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func jobsClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "SelectedSettingsViewController") as! SelectedSettingsViewController
        controller.type = .jobs
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func debitCardsClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "SelectedSettingsViewController") as! SelectedSettingsViewController
        controller.type = .debitCards
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func mounthlySpentClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "SelectedSettingsViewController") as! SelectedSettingsViewController
        controller.type = .mountlySpent
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func languageClicked(_ sender: Any) {
        let controller = UIViewController.getFromStoryboard(withId: "LanguageViewController") as! LanguageViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    
}

