//
//  NotificationCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/15/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class NotificationCell: UITableViewCell {
    @IBOutlet weak var notificationHeader: UILabel!
    @IBOutlet weak var notificationContent: UILabel!
    var markAsRead : Bool = false
//    var
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.markAsRead == false {
        self.notificationContent.font = UIFont.boldSystemFont(ofSize: 16)
        }
        
    }


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.markAsRead = true
        self.notificationContent.font = UIFont.systemFont(ofSize: 16)

    }
    func config(with notification: Notification){
        self.notificationHeader.text = notification.header
        self.notificationContent.text = notification.content
        
    }
}
