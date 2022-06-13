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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        
        productsCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! ProductInCollectionViewCellViewController
        cell.config(with: productsList[indexPath.row])
        return cell
    }
}
