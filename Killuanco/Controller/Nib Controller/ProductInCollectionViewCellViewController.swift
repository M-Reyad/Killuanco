//
//  productView.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ProductInCollectionViewCellViewController : UICollectionViewCell {
    
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
        productPrice.text = String(product.price)
        productName.text = product.name
    }
}
