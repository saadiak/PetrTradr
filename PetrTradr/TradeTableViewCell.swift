//
//  TradeTableViewCell.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit

class TradeTableViewCell: UITableViewCell {

    @IBOutlet weak var willingToGiveLabel: UILabel!
    @IBOutlet weak var lookingForLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
   
    
    
    @IBAction func onContact(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
