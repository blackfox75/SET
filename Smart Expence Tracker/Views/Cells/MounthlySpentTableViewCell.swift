//
//  MounthlySpentTableViewCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/1/20.
//

import UIKit

class MounthlySpentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOutlet: UILabel!
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
