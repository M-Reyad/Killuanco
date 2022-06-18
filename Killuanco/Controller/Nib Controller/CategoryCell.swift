//
//  CategoryCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/12/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    var productsList : [Product] = []
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        
        productsCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
    }
    
    func config(withProductsList productsList : [Product]/*, makeCollectionView horizontal: Bool*/){
        self.productsList = productsList
//        if horizontal{
//            self.productsCollectionView.direction
//        }
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of List is \(productsList.count)")
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! productView
        cell.config(with: productsList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 177*K.conversionIndex
        let height = 250*K.conversionIndex
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



