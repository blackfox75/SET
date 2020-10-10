//
//  ExtraSpentViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/4/20.
//

import UIKit

private let extraSpent = "ExtraSpentTableViewCell"

class ExtraSpentViewController: UIViewController {
    @IBOutlet weak var extraSpentTableView: UITableView!
    
    override func viewDidLoad() {
        self.title = "Extra Spent"
        super.viewDidLoad()
        extraSpentTableView.delegate = self
        extraSpentTableView.dataSource = self
        extraSpentTableView.register(UINib(nibName: extraSpent, bundle: nil), forCellReuseIdentifier: extraSpent)
    }


}

extension ExtraSpentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: extraSpent, for: indexPath) as! ExtraSpentTableViewCell
        cell.nameOutlet.text = "Extra"
        cell.dateOutlet.text = "04/02/2010"
        cell.priceOutlet.text = "$100"
        extraSpentTableView.rowHeight = 120
        
        
        return cell
    }
    
    
}
