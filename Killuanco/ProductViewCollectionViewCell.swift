//
//  ProductViewCollectionViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ProductViewCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        print("Shown!!")
        
    }
    
    
    @IBOutlet weak var productImage: RoundedCornerRadiusImage!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBAction func addButton(_ sender: Any) {
        
        print("added to Cart with Qantity\(productQuantity.text ?? "0.5 KG")")
    }
    
    func config(with product: Products){
        productPrice.text = String(product.price)
        productName.text = product.name
    }
}
