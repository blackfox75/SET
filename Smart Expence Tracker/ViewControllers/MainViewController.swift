//
//  MainViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/25/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var moneyViewOutlet: UIView!
    @IBOutlet weak var moneyDisplayOutlet: UILabel!
    @IBOutlet weak var titileForBankOutlet: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyViewOutlet.layer.cornerRadius = 20
        titileForBankOutlet.text = defaults.string(forKey: "NameOfDebitCard")
        moneyDisplayOutlet.text = String(defaults.double(forKey: "MoneyOnDebitcard"))
    }
    
//    @objc func callMethod() {
//        print("Working!")
//    }
    
    
    
    
    @IBAction func moneyViewClicked(_ sender: Any) {
        let vc = UIViewController.getFromStoryboard(withId: "YourMoneyViewController") as! YourMoneyViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
