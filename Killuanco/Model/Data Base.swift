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


var categoriesList : [Category] =
[Category(categoryName: "Organic",
          categoryImage: #imageLiteral(resourceName: "organic"),
          products: productsList),
 Category(categoryName: "Vegan",
          categoryImage: #imageLiteral(resourceName: "vegan"),
          products: productsList),
 Category(categoryName: "Bio",
          categoryImage: #imageLiteral(resourceName: "bio"),
          products: productsList),
 Category(categoryName: "Beds",
          categoryImage: #imageLiteral(resourceName: "beds"),
          products: productsList),
 Category(categoryName: "Food",
          categoryImage: #imageLiteral(resourceName: "food"),
          products: productsList),
 Category(categoryName: "Toys",
          categoryImage: #imageLiteral(resourceName: "toys"),
          products: productsList),
 Category(categoryName: "Carrier",
          categoryImage: #imageLiteral(resourceName: "carrier"),
          products: productsList),
 Category(categoryName: "Leashes",
          categoryImage: #imageLiteral(resourceName: "leashes"),
          products: productsList),
 Category(categoryName: "Snacks",
          categoryImage: #imageLiteral(resourceName: "snacks"),
          products: productsList),
 Category(categoryName: "New Products",
          categoryImage: #imageLiteral(resourceName: "new products"),
          products: productsList),
 Category(categoryName: "Top Sellers",
          categoryImage: #imageLiteral(resourceName: "top sellers"),
          products: productsList),
 Category(categoryName: "All",
          categoryImage: #imageLiteral(resourceName: "all"),
          products: productsList),]


var brandsList : [Category] =
[Category(categoryName: "Applaws", categoryImage: #imageLiteral(resourceName: "Rectangle 41"), products: productsList),
Category(categoryName: "Brit", categoryImage: #imageLiteral(resourceName: "Rectangle 42"), products: productsList),
Category(categoryName: "Eukanuba", categoryImage: #imageLiteral(resourceName: "Rectangle 43"), products: productsList),
Category(categoryName: "Concept", categoryImage: #imageLiteral(resourceName: "Rectangle 44"), products: productsList),
Category(categoryName: "Taste", categoryImage: #imageLiteral(resourceName: "Rectangle 45"), products: productsList)]


var foldersList: [Category] =
[Category(categoryName: "Monthly Order", categoryImage: #imageLiteral(resourceName: "Monthly Folder"), products: productsList),
 Category(categoryName: "Weekly Order", categoryImage: #imageLiteral(resourceName: "weeklyfolder"), products: productsList),
 Category(categoryName: "Miscelanious", categoryImage: #imageLiteral(resourceName: "newfolder"), products: productsList)]
