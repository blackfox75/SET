//
//  SelectedSettingsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/30/20.
//

import UIKit
private let debitCardsCell = "DebitCardsTableViewCell" //это id для указания в UINIB
// названия у класса и у xib должны быть одинаковые как и reuseIdentifier
private let jobsCell = "JobsTableViewCell"
private let mounthlySpent = "MounthlySpentTableViewCell"
private let planList = "PlanListTableViewCell"
//
private let isFromTabBar : Bool = true
//
class SelectedSettingsViewController: UIViewController {
    var type : SetingsType = .jobs
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let s = UIStoryboard(name: "Main", bundle: nil)
//        let c = s.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
//        c.changeTypeDelegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // обязательно нужно регистрировать Xib вот таким способом, везде указат наш reusIdentifier
        tableView.register(UINib(nibName: debitCardsCell, bundle: nil), forCellReuseIdentifier: debitCardsCell)
        tableView.register(UINib(nibName: jobsCell, bundle: nil), forCellReuseIdentifier: jobsCell)
        tableView.register(UINib(nibName: mounthlySpent, bundle: nil), forCellReuseIdentifier: mounthlySpent)
        tableView.register(UINib(nibName: planList, bundle: nil), forCellReuseIdentifier: planList)
        
        tableView.rowHeight = 140
    }

}

extension SelectedSettingsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
     
        switch type {
        case .jobs:
            let cell = tableView.dequeueReusableCell(withIdentifier: jobsCell, for: indexPath) as! JobsTableViewCell
            cell.jobsTitleOutlet.text = "Warehouse"
            cell.priceTitleOutlet.text = "$2342"
//            tableView.rowHeight = 90
            return cell
        case .mountlySpent:
            let cell = tableView.dequeueReusableCell(withIdentifier: mounthlySpent, for: indexPath) as! MounthlySpentTableViewCell
            cell.nameOutlet.text = "Laptop"
            cell.priceOutlet.text = "$1500"
            return cell
        case .extraSpent:
            break
        case .debitCards:
            let cell = tableView.dequeueReusableCell(withIdentifier: debitCardsCell, for: indexPath) as! DebitCardsTableViewCell
            cell.nameLabel.text = "Capital One Bank"
            cell.priceLabel.text = "$543"
            return cell
        case .planList:
            let cell = tableView.dequeueReusableCell(withIdentifier: planList, for: indexPath) as! PlanListTableViewCell
            cell.titleOutlet.text = "TV 50'"
            cell.priceOutlet.text = "$5433"
            return cell
        }
        
        return cell
    }
    
    
}

//extension SelectedSettingsViewController : ChangeTypesInSelectedVCDelegate {
//    func changeType(type: SetingsType) {
//        print(type)
//    }
//    
//    
//}
