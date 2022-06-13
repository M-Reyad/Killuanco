//
//  Category.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/10/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit

enum classification {
    case new, old
}

struct Category {
    let categoryName : String
    let categoryImage : UIImage
    let products : [Product]
}

struct Product {
    let name: String
    let price : Int
    var image: UIImage = UIImage(named: "productImage" )!
    var quantity: Int = 5
    var prodcutClassification : classification
    //    var category : Category
}

//struct ProductsClassification {
//    let categoryName : String
//    let products: [Product]
//}
