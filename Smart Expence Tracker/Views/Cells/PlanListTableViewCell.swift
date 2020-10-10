//
//  PlanListTableViewCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/1/20.
//

import UIKit

class PlanListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
