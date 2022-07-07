//
//  ProductsModel.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/10/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit

// Application Data Models//
class Category {
    let categoryName : String
    let categoryImage : UIImage
    let products : [Product]
    
    init(name: String, image: UIImage, products: [Product]) {
        self.categoryName = name
        self.categoryImage = image
        self.products = products
    }
    }

class StoredCategory: Category{
    let id : Int
    init(id: Int, categoryName: String, categoryImage: UIImage, products: [Product]){
        self.id = id
        super.init(name: categoryName, image: categoryImage, products: products)
    }
}

struct Product{
//    let id: Int
    var name: String
    var price : Float
//    let sku: String
    var image : UIImage
    var stock: Int
    var rating: Float
    var is_available : Bool
    var description: String
    var category : Int
    var isNew: Bool = true
    
    init(with apiProduct: APIProduct){
        self.name = apiProduct.name
        self.price = Float(apiProduct.price)!
        self.image = UIImage(named: K.imagePlaceHolder)!
        self.stock = apiProduct.stock
        self.rating = Float(apiProduct.rating)!
        self.is_available = apiProduct.is_available
        self.description = apiProduct.description
        self.category = apiProduct.category
    }

}
//=========================================================//

// API Data Models//
struct APIProduct: Codable{
    let id: Int
    let name: String
    let price : String
    let image : String
    let stock: Int
    let rating: String
    let is_available : Bool
    let description: String
    let category: Int
}
//struct ProductsClassification {
//    let categoryName : String
//    let products: [Product]
//}



struct Notifications {
    let date: String
    let notifications : [Notification]
}

struct Notification {
    let header :String
    let content :String
}
