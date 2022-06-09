//
//  ContactUsViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/7/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var contactUsHeight: NSLayoutConstraint!
    
override func viewDidLoad() {
    super.viewDidLoad()
    logoHeight.constant *= K.conversionIndex
    contactUsHeight.constant *= K.conversionIndex
    // Do any additional setup after loading the view.
}
}
