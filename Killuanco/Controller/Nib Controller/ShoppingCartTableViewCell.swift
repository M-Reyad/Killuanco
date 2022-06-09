//
//  ShoppingCartTableViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import ValueStepper


class ShoppingCartTableViewCell: UITableViewCell {
    
    //CELL DIMENSIONS CONSTRAINTS//
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
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
        
        //Optimizing Cell Dimensions//
        cellWidth.constant  *= K.conversionIndex
        cellHeight.constant *= K.conversionIndex
        
        print("Cell Width is \(cellWidth.constant) and Height is \(cellHeight.constant)")
        
    }

    //Config Function to produce Repeated Cells//
    func config(withProduct product: Product){
        productLabel.text = product.name
    }
    
}
