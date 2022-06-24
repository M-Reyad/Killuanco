//
//  productView.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit



class productView : UICollectionViewCell {
    
    @IBOutlet  var productImage: ProductCornerRadiusImage!
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
            self.productPrice.text = String(product.price)
            self.productName.text = product.name
        self.productImage.image = product.image
        self.productImage.frame = CGRect(x: 0, y: 0, width: 177, height: 138)
//        if product.

    }
}
