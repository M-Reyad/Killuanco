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
    @IBOutlet weak var productsView: UIView!
    @IBOutlet weak var noProductsView: UIView!

    
    var categoryManager = CategoryManager()
    let categoryID : Int? = nil
    var products: [Product] = []
    var newProducts : [Product] = []
    
    override func viewDidLoad() {
        
        categoryManager.delegate = self
        
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        self.productsTableView.register(UINib(nibName: K.CategoryCell, bundle: nil), forCellReuseIdentifier: K.CategoryCell)
    }
    func devidingProducts(from productsList: [Product]){
        for product in productsList {
            if product.isNew == true{
                newProducts.append(product)
            }
        }
    }
}

//MARK:- Products Table View Section
extension CategoryViewController : UITableViewDelegate, UITableViewDataSource{
//Uncomment This Section once new products Feature is added to the BackEnd//
    func numberOfSections(in tableView: UITableView) -> Int {
//        if self.newProducts.count == 0{
//            print("number of sections is 1")
//            return 1
//        }else{
//            print("Number of sections is 2")
//            return 2
//        }
        print("Returnin Number of Sections")
        return 1
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
        print("Returnin Number of Rows")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section, indexPath.row)
        print("Registered")
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CategoryCell, for: indexPath) as! CategoryCell
        
//        if indexPath.section == 0 {
//            cell.config(withProductsList: newProducts)
//            print("New Products count is \(newProducts.count)")
//            cell.collectionViewHeight.constant = 250*K.conversionIndex
//            return cell
//
//        }else{
        cell.config(withProductsList: self.products)
        print("all Products count is \(products.count)")
//            if let layout = cell.productsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                layout.scrollDirection = .vertical
//            }
            cell.collectionViewHeight.constant = 250*K.conversionIndex*CGFloat(products.count)
            cell.productsCollectionView.isScrollEnabled = false
            return cell
        }
        
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("Returning Height for Row")
        let height = 250*K.conversionIndex
//        if indexPath.section == 0{
//            return height+4
//        }else{
            return CGFloat(products.count) * (height+4)
        }
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if self.newProducts.count == 0{
            return "All Products"
//        } else {
//            if section == 0 {
//                return "New Products"
//            }else{
//                return "All Products"
//            }
//        }
    }
    
}
//MARK:- Category View Delegate
extension CategoryViewController: CategoryManagerDelegate{
    
    func didFinishPreparingProductsList(with productsList: [Product]) {
        DispatchQueue.main.async {
            print(productsList.count)
            if productsList.count == 0 {
                print("Empty Category")
                self.noProductsView.isHidden = false
                self.productsView.isHidden = true
            }else{
                print("Full Category")
                self.products = productsList
                print("Assigned")
                self.noProductsView.isHidden = true
                self.productsView.isHidden = false
                self.devidingProducts(from: productsList)
                self.productsTableView.reloadData()
                }
            }
        }
    }
    
    
