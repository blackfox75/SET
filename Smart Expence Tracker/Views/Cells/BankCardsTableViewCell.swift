//
//  BankCardsViewCellTableViewCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/22/20.
//

import UIKit

class BankCardsTableViewCell: UITableViewCell {

    @IBOutlet weak var bankTitle: UILabel!
    @IBOutlet weak var countOfMoney: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
