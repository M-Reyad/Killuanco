//
//  NotificationsViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class NotificationsViewController: UIViewController {
    
    
    @IBOutlet weak var notificationTableView: UITableView!
//    @IBOutlet weak var notificationTableViewHeight: NSLayoutConstraint!
   var notificationsList : [String : [Notification]] = ["Today" : [Notification(header: "New Discount!",
                                                 content: "You have a new Discount for Cat Products with 15%"),
                                    Notification(header: "New Discount!!",
                                                 content: "You have a new Discount for Dog Products with 20%")],
                         "Yesterday" : [Notification(header: "New Discount!!!",
                                                     content: "You have a new Discount for Cat Products with 35%"),
                                        Notification(header: "New Discount :)",
                                         content: "You have a new Discount for Dog Products with 10%"),
                                        Notification(header: "New Discount!!!",
                                                     content: "You have a new Discount for Cat Products with 35%")],
                         "Last Week" : [Notification(header: "New Discount!!!",
                                                     content: "You have a new Discount for Cat Products with 35%"),
                                        Notification(header: "New Discount :)",
                                                     content: "You have a new Discount for Dog Products with 10%"),
                                        Notification(header: "New Discount!!!",
                                                     content: "You have a new Discount for Cat Products with 35%"),
                                        Notification(header: "New Discount :)",
                                                     content: "You have a new Discount for Dog Products with 10%"),
                                        Notification(header: "New Discount!!!",
                                                     content: "You have a new Discount for Cat Products with 35%")]]
    var sectionsList = [String]()
    func generateSections(from notificationsList: [String:[Notification]]) {
        for (date, notifications) in notificationsList{
            self.sectionsList.append(date)
        }
        print(self.sectionsList)
    }

    override func viewDidLoad() {
         super.viewDidLoad()
        generateSections(from: self.notificationsList)
        notificationTableView.delegate = self
         notificationTableView.dataSource = self
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: K.notificationsCellIdentifier)
     }
     
}

//MARK:- Notifications Table View Protocols
extension NotificationsViewController :UITableViewDataSource, UITableViewDelegate{
    
    //Generating Headers for Sections//
    
    //--1-- Generating Number of Sections//
    func numberOfSections(in tableView: UITableView) -> Int {
        print("Number of sections is \(notificationsList.count)")
        return self.sectionsList.count
    }
    
    //--2-- Generating the Title of Sections//
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionsList[section]
    }
    
    //--3-- Generating Height of Sections//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(20)
    }
    

    //Generating Cells Data//
    //--1-- Generating Number of cells per Section//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of notification in section is \((notificationsList[sectionsList[section]]?.count)!)")
        return (notificationsList[sectionsList[section]]?.count)!
    }
    //--2-- Configuring Cells//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationCellIdentifier", for: indexPath) as! NotificationCell
        cell.config(with: (notificationsList[sectionsList[indexPath.section]]?[indexPath.row])!)
        print("Section is \(indexPath.section)")
        return cell
    }
    
    //--3-- Configuring Height for Cells//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 90*K.conversionIndex
        return height
    }
}
