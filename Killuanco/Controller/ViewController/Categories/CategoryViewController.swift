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
        productsTableView.register(UINib(nibName: K.CategoryCell, bundle: nil), forCellReuseIdentifier: K.CategoryCell)
        }else{
            print("Empty Category")
        }
    }
    
    func formingProductsLists(from productsList: [Product]){
        for product in productsList {
            if product.prodcutClassification == .new{
                newProducts.append(product)
//                print(newProducts.count)
            }else{
                self.allProducts.append(product)
//                print(allProducts.count)
            }
        }
    }
}


extension CategoryViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.newProducts.count == 0{
            print("number of sections is 1")
            return 1
        }else{
            print("Number of sections is 2")
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.allProducts.count == 0 || self.newProducts.count == 0 {
//        print("Only One Section")
//        if section > 0 {
//            print(allProducts.count)
//            return allProducts.count
//        }else{
//            return newProducts.count
//    }
//        }
//        else{
//            return allProducts.count
//        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CategoryCell, for: indexPath) as! CategoryCell
        
        if indexPath.section == 0 {
            cell.config(withProductsList: newProducts)
            print("New Products count is \(newProducts.count)")
            cell.collectionViewHeight.constant = 250*K.conversionIndex
        return cell

        }else{
            cell.config(withProductsList: allProducts)
            print("all Products count is \(allProducts.count)")
            if let layout = cell.productsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            cell.collectionViewHeight.constant = 250*K.conversionIndex*CGFloat(allProducts.count)
            cell.productsCollectionView.isScrollEnabled = false
        return cell
        }
        
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let height = 250*K.conversionIndex
            if indexPath.section == 0{
                return height+4
            }else{
                return CGFloat(allProducts.count) * (height+4)
            }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.newProducts.count == 0{
            return "All Products"
        } else {
        if section == 0 {
            return "New Products"
        }else{
            return "All Products"
            }
    }
}
}
