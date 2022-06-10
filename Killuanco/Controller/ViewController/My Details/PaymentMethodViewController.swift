//
//  PaymentMethodViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/8/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class PaymentMethodViewController: UIViewController {
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoHeight.constant *= K.conversionIndex
        paymentHeight.constant *= K.conversionIndex

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
