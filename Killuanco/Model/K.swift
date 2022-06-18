//
//  K.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/15/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit

//MARK:- K Struct

struct K {
    
    static let conversionIndex = UIScreen.main.bounds.width/414
    
    //Notification  Cell in Notification Table View
    static let notificationCell = "notificationCell"
    
    //Product View In Collection View
    static let productView = "productView"

    
    //Product Cell in Shopping Cart Table View
    static let productCell = "productCell"
    
    //Prodcut View in Collection View
    static let categoryView = "categoryView"
    
    static let CategoryCell = "CategoryCell"
    
    static let categoriesToCategorySegue = "categorySegue"
    
    static let categoryToProductSegue = "categoryToProductSegue"
    
    static let cartToProductSegue = "cartToProductSegue"
}

//MARK:- Custom Views Layout
class LargeRoundedCornerRadiusView : UIView{
    override func awakeFromNib() {
        layer.cornerRadius = 20
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 17
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
        layer.shouldRasterize = true
        layer.shadowOpacity = 0.15
        
        
    }
}
    
    
    class SmallRoundedCornerRadiusView : UIView{
    override func awakeFromNib() {
        layer.cornerRadius = 3
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
        layer.shouldRasterize = true
        layer.shadowOpacity = 0.15
        
        
    }
}
    
    
class ProductCornerRadiusImage: UIImageView {
    override func awakeFromNib() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
class RoundedCornerRadiusImage: UIImageView {
    override func awakeFromNib() {
        layer.cornerRadius = 50
        clipsToBounds = true
    }
}


class RoundedCornerRadiusOnboardingImages: UIImageView{
    override func awakeFromNib() {
        layer.cornerRadius = 292.5
        clipsToBounds = true
    }
}

class RoundedCornerRadiusButton: UIButton{
    override func awakeFromNib() {
        layer.cornerRadius = 15
        clipsToBounds = true
    }
}

