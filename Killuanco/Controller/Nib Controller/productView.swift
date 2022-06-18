//
//  productView.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import SDWebImage


class productView : UICollectionViewCell {
    
    @IBOutlet weak var productImage: ProductCornerRadiusImage!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBAction func addButton(_ sender: Any) {
        
        print("added to Cart with Qantity \(productQuantity.text ?? "0.5 KG")")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(with product: Product){
        productPrice.text = product.price
        productName.text = product.name
//        productImage!.sd_setImage(with: product.image, completed: nil)
        
    }
    }
