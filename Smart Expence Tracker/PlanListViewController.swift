//
//  PlanListViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/4/20.
//

import UIKit

private let planList = "PlanListTableViewCell"

class PlanListViewController: UIViewController {

    @IBOutlet weak var planListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planListTableView.delegate = self
        planListTableView.dataSource = self
        planListTableView.register(UINib(nibName: planList, bundle: nil), forCellReuseIdentifier: planList)
    }

}

extension PlanListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planList, for: indexPath) as! PlanListTableViewCell
        cell.titleOutlet.text = "Laptop"
        cell.priceOutlet.text = "$2351"
        planListTableView.rowHeight = 90
        return cell
    }
    
    
}
