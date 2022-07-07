//
//  ShoppingCartTableViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import ValueStepper
import SwipeCellKit


class productCell: SwipeTableViewCell {
    
    //Cell Labels//
    @IBOutlet weak var productLabel: UILabel!
    
    @IBOutlet weak var quantityStepper: ValueStepper!
    @IBOutlet weak var priceLabel: UILabel!
    
    //Stepper Function//
    @IBAction func stepperPressed(_ sender: Any) {
        
        print("Current Value is \(quantityStepper.value)")
    }
    
    
    //Awake From Nib Function//
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //Config Function to produce Repeated Cells//
    func config(withProduct product: Product){
        productLabel.text = product.name
    }
    
}
