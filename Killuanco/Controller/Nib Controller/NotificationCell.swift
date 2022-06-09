//
//  NotificationCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/15/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class NotificationCell: UITableViewCell {

    @IBOutlet weak var notificationHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notificationHeight.constant *= K.conversionIndex
        // Initialization code
    }

    @IBOutlet weak var notificationHeader: UILabel!
    
    @IBOutlet weak var notificationContent: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(with notification: Notifications){
        self.notificationHeader.text = notification.header
        self.notificationContent.text = notification.content
        
    }
}
