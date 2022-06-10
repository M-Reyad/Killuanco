//
//  HomeViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

var products : [Product] = [Product(name: "Cat Food",price: 15),
                            Product(name: "Doggy Food", price: 20),
                            Product(name: "Turtle Food", price: 20),
                            Product(name: "Frog Food", price: 20)]


var categoriesList : [Category] =
    [Category(categoryName: "Organic", categoryImage: #imageLiteral(resourceName: "Organic"), products: products),
     Category(categoryName: "Vegan", categoryImage: #imageLiteral(resourceName: "Vegan"), products: products),
     Category(categoryName: "Bio", categoryImage: #imageLiteral(resourceName: "Bio"), products: products),
     Category(categoryName: "Beds", categoryImage: #imageLiteral(resourceName: "Beds"), products: products),
     Category(categoryName: "Food", categoryImage: #imageLiteral(resourceName: "Food"), products: products),
     Category(categoryName: "Toys", categoryImage: #imageLiteral(resourceName: "Toys"),products: products),
     Category(categoryName: "Carrier",categoryImage: #imageLiteral(resourceName: "Carriers"),products: products),
     Category(categoryName: "Leashes",categoryImage: #imageLiteral(resourceName: "Leashes"),products: products),
     Category(categoryName: "Snacks",categoryImage: #imageLiteral(resourceName: "Snacks"),products: products),
     Category(categoryName: "Best Seller",categoryImage: #imageLiteral(resourceName: "Best Sellers"), products: products)]

class HomeViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mostSelledProductsHeight: NSLayoutConstraint!
    @IBOutlet weak var greenViewHeight: NSLayoutConstraint!
    @IBOutlet weak var shopVeganHeight: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var topSellingProductsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.categoriesCollectionViewHeight.constant *= K.conversionIndex
        print("Categories Height is \(categoriesCollectionViewHeight.constant)")
        self.mostSelledProductsHeight.constant *= K.conversionIndex
        print("Most Selling Height is \(mostSelledProductsHeight.constant)")
        self.greenViewHeight.constant *= K.conversionIndex
        self.shopVeganHeight.constant *= K.conversionIndex
        
        
        categoriesCollectionView.register(UINib(nibName: K.favoritesInCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: K.favoritesInCollectionViewCellIdentifier)
        
        topSellingProductsCollectionView.register(UINib(nibName: K.productsInCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: K.productsInCollectionViewCellIdentifier)

        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        topSellingProductsCollectionView.dataSource = self
        topSellingProductsCollectionView.delegate = self
    }
    @IBOutlet weak var searchBarPressed: UISearchBar!
    @IBAction func shoppingCartButtonPressed(_ sender: Any) {
    }
    
    @IBAction func notificationButtonPressed(_ sender: Any) {
    }
    
    @IBAction func seeAllButtonPressed(_ sender: Any) {
    }


}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoriesCollectionView {
            return categoriesList.count
        }else{
            return products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoriesCollectionView {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: K.favoritesInCollectionViewCellIdentifier, for: indexPath) as! FavoritesCollectionViewCell
            cell.config(withCategory: categoriesList[indexPath.row])
            print("Categories Cell Size is  \(cell.contentView.bounds.height) , \(cell.contentView.bounds.width)")
            return cell
        }else{
            let cell = topSellingProductsCollectionView.dequeueReusableCell(withReuseIdentifier: K.productsInCollectionViewCellIdentifier, for: indexPath) as! ProductInCollectionViewCellViewController
            cell.config(with: products[indexPath.row])
            print("Top Selling Cell Size is  \(cell.contentView.bounds.height) , \(cell.contentView.bounds.width)")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoriesCollectionView {
        let height = 114*K.conversionIndex
        let width = 95*K.conversionIndex
        return CGSize(width: width, height: height)
        }else{
        let height = 245*K.conversionIndex
        let width = 185*K.conversionIndex
        return CGSize(width: width, height: height)
        }
    }
    
}
