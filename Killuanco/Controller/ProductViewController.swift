//
//  ProductViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import RateBar



class ProductViewController: UIViewController{

    
    
    
    @IBAction func cartButtonPressed(_ sender: Any) {
        
        
    }
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var piecesPerStock: UILabel!
    @IBOutlet weak var gmsPerPiece: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var stepperValueLabel: UILabel!
    @IBOutlet weak var ratingBar: RatingBar!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var describtionTitle: UILabel!
    @IBOutlet weak var describtion: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        
        stepperValueLabel.text = String(quantityStepper.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func  addToCartButtonPressed(_ sender: Any){
        
    }
    
    

    
    @IBAction func addToFolderButtonPressed(_ sender: Any) {
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


extension ProductViewController: RatingBarDelegate{
    func RatingBar(_ ratingBar: RatingBar, didChangeValue value: Int) {
        print("Rating Value now is \(ratingBar)")
    }
}


