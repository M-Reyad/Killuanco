//
//  CategoriesViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/10/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

//var products : [Product] =
//    [Product(name: "Cat Food",price: 15),
//     Product(name: "Doggy Food", price: 20),
//     Product(name: "Turtle Food", price: 20),
//     Product(name: "Frog Food", price: 20)]
//
//var categoriesList : [Category] =
//    [Category(categoryName: "Organic",
//              categoryImage: #imageLiteral(resourceName: "organic"),
//              products: products),
//     Category(categoryName: "Vegan",
//              categoryImage: #imageLiteral(resourceName: "vegan"),
//              products: products),
//     Category(categoryName: "Bio",
//              categoryImage: #imageLiteral(resourceName: "bio"),
//              products: products),
//     Category(categoryName: "Beds",
//              categoryImage: #imageLiteral(resourceName: "beds"),
//              products: products),
//     Category(categoryName: "Food",
//              categoryImage: #imageLiteral(resourceName: "food"),
//              products: products),
//     Category(categoryName: "Toys",
//              categoryImage: #imageLiteral(resourceName: "toys"),
//              products: products),
//     Category(categoryName: "Carrier",
//              categoryImage: #imageLiteral(resourceName: "carrier"),
//              products: products),
//     Category(categoryName: "Leashes",
//              categoryImage: #imageLiteral(resourceName: "leashes"),
//              products: products),
//     Category(categoryName: "Snacks",
//              categoryImage: #imageLiteral(resourceName: "snacks"),
//              products: products),
//     Category(categoryName: "New Products",
//              categoryImage: #imageLiteral(resourceName: "new products"),
//              products: products),
//     Category(categoryName: "Top Sellers",
//              categoryImage: #imageLiteral(resourceName: "top sellers"),
//              products: products),
//     Category(categoryName: "All",
//              categoryImage: #imageLiteral(resourceName: "all"),
//              products: products),]

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
////        let layout = UICollectionViewFlowLayout()
////        layout.estimatedItemSize.width = 50
////        layout.estimatedItemSize.height = 50
////        layout.clip
////        categoriesCollectionView.collectionViewLayout = layout
//        categoriesCollectionView.dataSource = self
//        categoriesCollectionView.delegate = self
//
//        categoriesCollectionView.register(UINib(nibName: K.favoritesInCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: K.favoritesInCollectionViewCellIdentifier)
        
    }

}
//
//
//extension CategoriesViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        print("Counted")
//        return categoriesList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: K.favoritesInCollectionViewCellIdentifier, for: indexPath) as! FavoritesCollectionViewCell
//        print("Configured")
//        cell.config(withCategory: categoriesList[indexPath.row])
//        print("returned")
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 90, height: 90)
//    }
    

