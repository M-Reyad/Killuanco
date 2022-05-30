//
//  CategoryViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/27/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import DragMenuPicker


class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let newProducts: [Products] = [Products(name: "Doggy food", price: 12),
                                   Products(name: "Cat Food", price: 15),
                                   Products(name: "Turtles Food", price: 20),
                                   Products(name: "Birds Food", price: 20)]
    
    
    let allProducts: [Products] = [Products(name: "Doggy food", price: 20),
                                   Products(name: "Cat Food", price: 13),
                                   Products(name: "Turtles Food", price: 23),
                                   Products(name: "Birds Food", price: 23),
                                   Products(name: "Doggy food", price: 22),
                                   Products(name: "Cat Food", price: 15),
                                   Products(name: "Turtles Food", price: 20),
                                   Products(name: "Birds Food", price: 20)]
    
    
    
    @IBOutlet weak var newProductsCollectionView: UICollectionView!
    @IBOutlet weak var allProductsCollectionView: UICollectionView!
    
    
    @IBAction func filtersButtonPressed(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("Height = \(UIScreen.main.bounds.height)")
        print("Width = \(UIScreen.main.bounds.width)")
        self.newProductsCollectionView.dataSource = self
        self.allProductsCollectionView.dataSource = self
        
        
        self.allProductsCollectionView.register(UINib(nibName: K.productsCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.productsCollectionViewCellIdentifier)
        self.newProductsCollectionView.register(UINib(nibName: K.productsCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.productsCollectionViewCellIdentifier)
        
        
        //        newProductsC®sCollectionViewCellIdentifier)
        
        //        allProductsCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == newProductsCollectionView){
            return newProducts.count
        }
        return allProducts.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == newProductsCollectionView){
            let cell = newProductsCollectionView.dequeueReusableCell(withReuseIdentifier: K.productsCollectionViewCellIdentifier, for: indexPath) as! ProductViewCollectionViewCell
            cell.config(with: newProducts[indexPath.row])
            print("returned")
            return cell
        }else{
            let cell = newProductsCollectionView.dequeueReusableCell(withReuseIdentifier: K.productsCollectionViewCellIdentifier, for: indexPath) as! ProductViewCollectionViewCell
            cell.config(with: allProducts[indexPath.row])
            print("returned")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)/2
        let height = (UIScreen.main.bounds.height)/3
        
        return CGSize(width: width, height: height)
    }
    
}
