//
//  ReminderCell.swift
//  PetrTradr
//
//  Created by Saadia Karim on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
