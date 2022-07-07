//
//  CategoryManager.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/24/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation


protocol CategoryManagerDelegate {
    func didFinishPreparingProductsList(with productsList: [Product])
}

struct CategoryManager {
    var delegate : CategoryManagerDelegate?
    func prepareProductsList(from wholeProducts: [Product]?, belongingTo category: StoredCategory){
            var categoryProductsList : [Product] = []
            if let safeWholeProducts = wholeProducts{
                for product in safeWholeProducts{
                    if product.category == category.id{ categoryProductsList.append(product)
                    }
            }
            }else{
                print("Found Nil!!")
        }
        
        print("From Here!! \(categoryProductsList.count)")
    self.delegate?.didFinishPreparingProductsList(with: categoryProductsList)
    }
}
