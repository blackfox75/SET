//
//  MainViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/25/20.
//

import UIKit
private let bankCard = "BankCardsTableViewCell"

class MainViewController: UIViewController {
    
    var info : JobsQuestionViewController = JobsQuestionViewController()
    var user : User?
    var job : Job?
    var debitCard : DebitCard?
    var count = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        debitCard?.debitCardName = info.debitCardInfo.debitCardName
//        debitCard?.debitCardAmountOfMoney = info.debitCardInfo.debitCardAmountOfMoney
        user = info.userInfo
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: bankCard, bundle: nil), forCellReuseIdentifier: bankCard)
        
        count = info.defaults.integer(forKey: "CountOfDebitCards")
        print(count)
        
        
//        for _ in 1...count {
//            info.defaults.integer(forKey: "CountOfDebitCards")
//            info.defaults.string(forKey: "NameOfDebitCard")
//            info.defaults.integer(forKey: "MoneyOnDebitcard")
//        }
        
        mainTableView.reloadData()
        
        for _ in 0..<(user?.debitCard.count)! {
            print(debitCard?.debitCardName as Any)
        }
    }
    
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return usersArray.count
        return (info.defaults.integer(forKey: "CountOfDebitCards"))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: bankCard, for: indexPath) as! BankCardsTableViewCell
      
//        let users = info.defaults.array(forKey: "UserInfoArray")![indexPath.row]
        
        if let savedData = defaults.object(forKey: "UserInfoArray") as? Data {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(User.self, from: savedData) {
                print("loaded")
                //to do something
                let debitCard = loadedData.debitCard[indexPath.row]
                
                cell.bankTitle.text = debitCard.debitCardName
                cell.countOfMoney.text = String(debitCard.debitCardAmountOfMoney)
            } else {
                print("Not working!")
            }
            
        }
        mainTableView.rowHeight = 120
        return cell
    }
    
    
}

