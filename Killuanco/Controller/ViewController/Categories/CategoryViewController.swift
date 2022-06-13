//
//  ProductsTableViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/9/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit



class CategoryViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var categoryName: UILabel!
    
    var products: [Product]? = nil
    var safeProducts: [Product] = []
    var newProducts : [Product] = []
    var allProducts : [Product] = []

    override func viewDidLoad() {
//          logoHeight.constant *= K.conversionIndex
        
        //Unwrapping The Optional Products List!!
        if let safeProducts = products{
            self.safeProducts = safeProducts
            formingProductsLists(from: safeProducts)
            
            productsTableView.register(UINib(nibName: K.productView, bundle: nil), forCellReuseIdentifier: K.productView)
        }else{
            print("Empty Category")
        }
    }
    
    func formingProductsLists(from productsList: [Product]){
        for product in productsList {
            if product.prodcutClassification == .new{
                newProducts.append(product)
            }else{
                self.allProducts.append(product)
            }
        }
    }
}


extension CategoryViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.allProducts.count == 0 || self.newProducts.count == 0{
            return 1
        }else{
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.allProducts.count == 0 || self.newProducts.count == 0 {
        
        if section > 0 {
            return allProducts.count
        }else{
            return newProducts.count
    }
        }
        else{
            return allProducts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CategoryCell, for: indexPath) as! CategoryCell
        
        if indexPath.section == 0 {
            cell.config(withProductsList: [newProducts[indexPath.row]])
        return cell

        }else{
            cell.config(withProductsList: [allProducts[indexPath.row]])
        return cell
        }
        
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let height = 250*K.conversionIndex
//            var width = 177*K.conversionIndex
            if indexPath.section > 0{
                return height+4
            }else{
                return CGFloat(allProducts.count) * height
            }
    }
}
