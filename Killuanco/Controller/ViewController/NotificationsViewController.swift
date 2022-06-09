//
//  NotificationsViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class NotificationsViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var notificationTableView: UITableView!
    @IBOutlet weak var notificationTableViewHeight: NSLayoutConstraint!
    
    let notifications: [Notifications] = [Notifications(header: "New Discount!!",
                                                        content: "You have discount 15% special for you!!"),
                                          Notifications(header: "New Discount!!",
                                                        content: "You have a discount 20% special for you!!"),
                                          Notifications(header: "New Discount!!",
                                                        content: "You have a discount 25% special for you!!")]
    override func viewDidLoad() {
         super.viewDidLoad()
        //Optimizing Dimensions
        logoHeight.constant *= K.conversionIndex
        notificationTableViewHeight.constant *= K.conversionIndex
        
         notificationTableView.dataSource = self
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: K.notificationsCellIdentifier)
     }
     

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationCellIdentifier", for: indexPath) as! NotificationCell
        
        
        cell.config(with: notifications[indexPath.row])
        
        return cell
    }
    


 


}
