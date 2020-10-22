//
//  MainViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/25/20.
//

import UIKit
private let bankCard = "BankCardsTableViewCell"

class MainViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let userInfo = User()
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: bankCard, bundle: nil), forCellReuseIdentifier: bankCard)
    }
    
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaults.integer(forKey: "CountOfDebitCards")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bankCard, for: indexPath) as! BankCardsTableViewCell
//        cell.bankTitle.text = defaults.string(forKey: "NameOfDebitCard")
        cell.bankTitle.text = String(userInfo.countOfDebitCards)
        cell.countOfMoney.text = String(defaults.integer(forKey: "MoneyOnDebitcard"))
        mainTableView.rowHeight = 120
        return cell
    }
    
    
}

