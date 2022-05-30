//
//  NotificationsViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

struct Notifications {
    let header: String
    let content: String
}


class NotificationsViewController: UIViewController,UITableViewDataSource {
    
        @IBOutlet weak var notificationTableView: UITableView!
    
    let notifications: [Notifications] = [Notifications(header: "New Discount!!",
                                                        content: "You have discount 15% special for you!!"),
                                          Notifications(header: "New Discount!!",
                                                        content: "You have a discount 20% special for you!!"),
                                          Notifications(header: "New Discount!!",
                                                        content: "You have a discount 25% special for you!!")]
    override func viewDidLoad() {
         super.viewDidLoad()
         notificationTableView.dataSource = self
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: K.notificationCellIdentifier)
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
