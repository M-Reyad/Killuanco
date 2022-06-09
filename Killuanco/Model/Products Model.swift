//
//  Products Model.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit

struct ProductsCategory {
    let categoryName : String
    let products: [Product]
}

struct Product {
    let name: String
    let price : Int
    var image: UIImage = UIImage(named: "productImage" )!
    var quantity: Int = 5
}
