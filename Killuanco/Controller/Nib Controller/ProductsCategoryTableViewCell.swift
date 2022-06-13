//
//  ProductsCategoryTableViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/9/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ProductsCategoryTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    var products = [Product]()
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewHeight.constant *= K.conversionIndex
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        categoryCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
        print("Registered")
    }
    
//    func config(with productsCategory: ProductsClassification){
//        self.categoryName.text = productsCategory.categoryName
//        self.products = productsCategory.products
//        self.categoryCollectionView.reloadData()
//        print("Reloaded")
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print(self.products.count)
         return self.products.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         print("Returned")
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! ProductInCollectionViewCellViewController
         
         print("Returned !!")
         cell.config(with: products[indexPath.row])
         return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 177, height: 250)
     }

}
