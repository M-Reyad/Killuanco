//
//  ProductsModel.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/10/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit

//enum is_available: Bool, Codable {
//
//    case true, false
//}

struct Category {
    let categoryName : String
    let categoryImage : UIImage
    let products : [Product]
}

struct Product: Codable {
    let id: Int
    let name: String
    let price : String
    let sku: String
    var image : String
    var stock: Int
    var rating: String
    var is_available : Bool
    //    var category : Category
}

//struct ProductsClassification {
//    let categoryName : String
//    let products: [Product]
//}


struct CategoryFolder {
    let folderName : String
    let folderImage : UIImage
    let products : [Product]
}


struct Notifications {
    let date: String
    let notifications : [Notification]
}

struct Notification {
    let header :String
    let content :String
}
