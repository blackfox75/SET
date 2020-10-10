//
//  YourMoneyViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/26/20.
//

import UIKit

class YourMoneyViewController: UIViewController {

    @IBOutlet weak var transactionTableView: UITableView!
    @IBOutlet weak var incognitoView: UIView!
    @IBOutlet weak var changePINView: UIView!
    @IBOutlet weak var accountInfoView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        incognitoView.layer.cornerRadius = 20
        changePINView.layer.cornerRadius = 20
        accountInfoView.layer.cornerRadius = 20
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension YourMoneyViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionViewCell
        cell.descriptionLabel.text = "Apartment"
        cell.sumLabel.text = "-500$"
        cell.dateLabel.text = "04/05/2020"
        
        return cell
    }
    
}
