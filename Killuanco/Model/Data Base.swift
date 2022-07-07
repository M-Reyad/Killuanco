//
//  Data Base.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/12/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation

var notificationsList : [String : [Notification]] = ["Today" : [Notification(header: "New Discount!",
                        content: "You have a new Discount for Cat Products with 15%"),
           Notification(header: "New Discount!!",
                        content: "You have a new Discount for Dog Products with 20%")],
"Yesterday" : [Notification(header: "New Discount!!!",
                            content: "You have a new Discount for Cat Products with 35%"),
               Notification(header: "New Discount :)",
                content: "You have a new Discount for Dog Products with 10%"),
               Notification(header: "New Discount!!!",
                            content: "You have a new Discount for Cat Products with 35%")],
"Last Week" : [Notification(header: "New Discount!!!",
                            content: "You have a new Discount for Cat Products with 35%"),
               Notification(header: "New Discount :)",
                            content: "You have a new Discount for Dog Products with 10%"),
               Notification(header: "New Discount!!!",
                            content: "You have a new Discount for Cat Products with 35%"),
               Notification(header: "New Discount :)",
                            content: "You have a new Discount for Dog Products with 10%"),
               Notification(header: "New Discount!!!",
                            content: "You have a new Discount for Cat Products with 35%")]]
var productsList : [Product] = []
//[Product(name: "Doggy Food", price: 20, prodcutClassification: classification.new),
// Product(name: "Turtle Food", price: 20, prodcutClassification: classification.new),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.old),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.old),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.new),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.old),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.new),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.old),
// Product(name: "Frog Food", price: 20, prodcutClassification: classification.old)]


var categoriesList : [StoredCategory] =
    [StoredCategory(id: 3, categoryName: "Organic",
                    categoryImage: #imageLiteral(resourceName: "organic"),
                    products: productsList),
     StoredCategory(id: 4, categoryName: "Vegan",
                    categoryImage: #imageLiteral(resourceName: "vegan"),
                    products: productsList),
     StoredCategory(id: 5, categoryName: "Bio",
                    categoryImage: #imageLiteral(resourceName: "bio"),
                    products: productsList),
     StoredCategory(id: 2, categoryName: "Beds",
                    categoryImage: #imageLiteral(resourceName: "beds"),
                    products: productsList),
     StoredCategory(id: 1, categoryName: "Food",
                    categoryImage: #imageLiteral(resourceName: "food"),
                    products: productsList),
     StoredCategory(id: 7, categoryName: "Toys",
                    categoryImage: #imageLiteral(resourceName: "toys"),
                    products: productsList),
     StoredCategory(id: 6, categoryName: "Carrier",
                    categoryImage: #imageLiteral(resourceName: "carrier"),
                    products: productsList),
     StoredCategory(id: 8, categoryName: "Leashes",
                    categoryImage: #imageLiteral(resourceName: "leashes"),
                    products: productsList),
     StoredCategory(id: 9, categoryName: "Snacks",
                    categoryImage: #imageLiteral(resourceName: "snacks"),
                    products: productsList),
     StoredCategory(id: 0, categoryName: "New Products",
                    categoryImage: #imageLiteral(resourceName: "new products"),
                    products: productsList),
     StoredCategory(id: 99, categoryName: "Top Sellers",
                    categoryImage: #imageLiteral(resourceName: "top sellers"),
                    products: productsList),
     StoredCategory(id: 100, categoryName: "All",
                    categoryImage: #imageLiteral(resourceName: "all"),
                    products: productsList),]


var brandsList : [Category] =
    [Category(name: "Applaws", image: #imageLiteral(resourceName: "Rectangle 41"), products: productsList),
     Category(name: "Brit", image: #imageLiteral(resourceName: "Rectangle 42"), products: productsList),
     Category(name: "Eukanuba", image: #imageLiteral(resourceName: "Rectangle 43"), products: productsList),
     Category(name: "Concept", image: #imageLiteral(resourceName: "Rectangle 44"), products: productsList),
     Category(name: "Taste", image: #imageLiteral(resourceName: "Rectangle 45"), products: productsList)]


var foldersList: [Category] =
    [Category(name: "Monthly Order", image: #imageLiteral(resourceName: "Monthly Folder"), products: productsList),
     Category(name: "Weekly Order", image: #imageLiteral(resourceName: "weeklyfolder"), products: productsList),
     Category(name: "Miscelanious", image: #imageLiteral(resourceName: "newfolder"), products: productsList)]
