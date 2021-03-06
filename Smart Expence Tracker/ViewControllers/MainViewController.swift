//
//  MainViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/25/20.
//

import UIKit
private let bankCard = "BankCardsTableViewCell"

class MainViewController: UIViewController {
    
    var info = JobsQuestionViewController()
    var user = User()
    var job = Job()
    var debitCard = DebitCard()
    var count = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: bankCard, bundle: nil), forCellReuseIdentifier: bankCard)
        mainTableView.reloadData()
//        info.main = self

    }
    
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return info.userInfo.countOfDebitCards
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: bankCard, for: indexPath) as! BankCardsTableViewCell
        
        if let testData = UserDefaults.standard.data(forKey: "UserInfoArray"),
            let test = try? JSONDecoder().decode([User].self, from: testData) {
            let debitCard = test.first?.debitCard[indexPath.row]
                // узнать какой конкретно user зареган
            cell.bankTitle.text = debitCard?.debitCardName ?? ""
            cell.countOfMoney.text = String(debitCard!.debitCardAmountOfMoney)
        }
        
        mainTableView.rowHeight = 120
        return cell
    }
    
    
}

