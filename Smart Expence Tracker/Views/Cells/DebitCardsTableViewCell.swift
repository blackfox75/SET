//
//  SettingsItemTableViewCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/30/20.
//

import UIKit

class DebitCardsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
