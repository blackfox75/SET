//
//  MainViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/25/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var moneyViewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyViewOutlet.layer.cornerRadius = 20
        self.title = "Money"
        
    }
    
    @objc func callMethod() {
        print("Working!")
    }
    
    
    
    
    @IBAction func moneyViewClicked(_ sender: Any) {
        let vc = UIViewController.getFromStoryboard(withId: "YourMoneyViewController") as! YourMoneyViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
