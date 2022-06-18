//
//  ProductViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import RateBar
import ValueStepper
//import SDWebImage


class ProductViewController: UIViewController{


    @IBOutlet  var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var piecesPerStock: UILabel!
    @IBOutlet weak var gmsPerPiece: UILabel!
    
    @IBOutlet weak var quantityStepper: ValueStepper!
    @IBOutlet weak var ratingBar: RatingBar!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var describtionTitle: UILabel!
    @IBOutlet weak var describtion: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        print(quantityStepper.value)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingBar.rateValue = Int(3.5)

    }
    
    
    
    @IBAction func  addToCartButtonPressed(_ sender: Any){
        print("Added to Cart")
    }
    
    

    
    @IBAction func addToFolderButtonPressed(_ sender: Any) {
        print("Added to Folder")
    }

    
    func config(with product: Product?){
        self.productName.text = product!.name
        self.priceLabel.text = String(product!.price)
        self.productImage = UIImageView(image: UIImage(named: "productPic"))
        }
}


extension ProductViewController: RatingBarDelegate{
    func RatingBar(_ ratingBar: RatingBar, didChangeValue value: Int) {
        print("Rating Value now is \(ratingBar)")
    }
}


