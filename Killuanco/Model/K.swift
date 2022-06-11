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
    
    
    static let notificationsCellIdentifier = "NotificationCellIdentifier"
    static let notificationsNibName = "NotificationCell"
    
    
    
    static let homeCategoriesIconWidth = 90/414
    static let homeCategoriesIconLength = 115.86/1570

    
    
    static let productsInCollectionViewCellIdentifier = "ProductViewCollectionViewCell"
    static let productsInCollectionViewNibName = "ProductView"
    
    
    
    
    static let favoritesInCollectionViewNibName = "FavoritesCollectionViewCell"
    static let favoritesInCollectionViewCellIdentifier = "FavoritesReuseIdentifier"
    
    
    
    static let productsInShoppingTableNibName = "ShoppingCartCellNib"
    static let productsInShoppingTableCellIdentifier = "ShoppingCartReuseCellIdentifier"
    
    
    static let productsInCategoryTableViewCellIdentifier = "CategoryTableViewCellIdentifier"
    static let productsInCategoryTableViewNibName = "CategoryTableViewNib"
    
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

