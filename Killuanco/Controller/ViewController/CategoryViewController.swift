//
//  ProductsTableViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/9/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    
    let products : [ProductsCategory] =
        [ProductsCategory(categoryName: "New Products",
                          products:
            [Product(name: "Cat Food", price: 15),
             Product(name: "Doggy Food", price: 20),
             Product(name: "Turtle Food", price: 20),
             Product(name: "Frog Food", price: 20)]),
        ProductsCategory(categoryName: "All Products",
                         products:
            [Product(name: "Cat Food", price: 15),
             Product(name: "Doggy Food", price: 20),
             Product(name: "Turtle Food", price: 20),
             Product(name: "Frog Food", price: 20)])]
    
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
          logoHeight.constant *= K.conversionIndex
        productsTableView.register(UINib(nibName: K.productsInCategoryTableViewNibName, bundle: nil), forCellReuseIdentifier:K.productsInCategoryTableViewCellIdentifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        if indexPath.row > 0{
            let cell = productsTableView.dequeueReusableCell(withIdentifier: K.productsInCategoryTableViewCellIdentifier, for: indexPath) as! ProductsCategoryTableViewCell
            cell.config(with: products[indexPath.row])
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            cell.categoryCollectionView.setCollectionViewLayout(layout, animated: false)
            return cell

        } else {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: K.productsInCategoryTableViewCellIdentifier, for: indexPath) as! ProductsCategoryTableViewCell
        cell.config(with: products[indexPath.row])
        return cell
    }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
