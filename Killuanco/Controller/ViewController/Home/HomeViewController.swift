//
//  HomeViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    //MARK:- View Controller Variables
    //View Controller Constraints//
    @IBOutlet weak var categoriesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mostSelledProductsHeight: NSLayoutConstraint!
    @IBOutlet weak var greenViewHeight: NSLayoutConstraint!
    @IBOutlet weak var shopVeganHeight: NSLayoutConstraint!
    @IBOutlet weak var foldersCollectionVIewHeight: NSLayoutConstraint!
    @IBOutlet weak var shopByBrandsHeight: NSLayoutConstraint!
    
    //View Controller Variables//
    @IBOutlet weak var searchBarPressed: UISearchBar!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var topSellingProductsCollectionView: UICollectionView!
    @IBOutlet weak var shopByBrandsCollectionView: UICollectionView!
    @IBOutlet weak var foldersCollectionView: UICollectionView!
    var productsListManager = ProductsListManager()
    var products: [Product]?
    
    
    //MARK:- View Controller View
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.productsListManager.fetchingProductsList(from: "https://killuandco.herokuapp.com/api/?format=json")
        }
        
        //Optimizing Constants//
        self.shopByBrandsHeight.constant *= K.conversionIndex
        self.categoriesCollectionViewHeight.constant *= K.conversionIndex
        self.mostSelledProductsHeight.constant *= K.conversionIndex
        self.greenViewHeight.constant *= K.conversionIndex
        self.shopVeganHeight.constant *= K.conversionIndex
        self.foldersCollectionVIewHeight.constant *= K.conversionIndex
        
        //Registering Nibs//
        shopByBrandsCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)
        
        categoriesCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)
        
        topSellingProductsCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
        
        foldersCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)
        
        //Deploying DataSources and Delegates//
        productsListManager.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        topSellingProductsCollectionView.dataSource = self
        topSellingProductsCollectionView.delegate = self
        
        shopByBrandsCollectionView.dataSource = self
        shopByBrandsCollectionView.delegate = self
        
        foldersCollectionView.dataSource = self
        foldersCollectionView.delegate = self
        
        
    }
    
    //MARK:- View Controller Buttons Actions//
    //Shopping Cart Button Action//
    @IBAction func shoppingCartButtonPressed(_ sender: Any) {
    }
    //Notification Button Action//
    @IBAction func notificationButtonPressed(_ sender: Any) {
    }
    //See All Button Action//
    @IBAction func seeAllButtonPressed(_ sender: Any) {
    }
}

//MARK:-Collection View Section
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if
            collectionView == self.categoriesCollectionView {
            return categoriesList.count
            
        } else if
            collectionView == shopByBrandsCollectionView{
            return brandsList.count
            
        }else if
            collectionView == foldersCollectionView{
            return foldersList.count
            
        }else {
            return productsList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topSellingProductsCollectionView {
            
            let cell = topSellingProductsCollectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! productView
            
            cell.config(with: productsList[indexPath.row])
            
            return cell
            
        } else {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: K.categoryView, for: indexPath) as! categoryView
            
            if collectionView == categoriesCollectionView{
                cell.configForCategory(withCategory: categoriesList[indexPath.row], withTitle: true)
                return cell
                
            }else if collectionView == foldersCollectionView{
                cell.configForCategory(withCategory: foldersList[indexPath.row], withTitle: false)
                return cell
            }else{
                cell.configForCategory(withCategory: brandsList[indexPath.row], withTitle: false)
                return cell
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.categoriesCollectionView {
            let height = 114*K.conversionIndex
            let width = 95*K.conversionIndex
            return CGSize(width: width, height: height)
            
        }else if collectionView == shopByBrandsCollectionView{
            let height = 70 * K.conversionIndex
            let width = 110 * K.conversionIndex
            return CGSize(width: width, height: height)
            
        }else if collectionView == foldersCollectionView{
            let height = 177*K.conversionIndex
            let width = 176*K.conversionIndex
            return CGSize(width: width, height: height)
            
        }else{
            let height = 245*K.conversionIndex
            let width = 185*K.conversionIndex
            return CGSize(width: width, height: height)
        }
    }
    //MARK:- Segues Section
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Category Segue
        if collectionView == categoriesCollectionView{
            performSegue(withIdentifier: K.homeToCategorySegue, sender: indexPath)
        //Product Segue
        }else if collectionView == topSellingProductsCollectionView{
            performSegue(withIdentifier: K.homeToProductSegue, sender: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Category Segue
        if segue.identifier == K.homeToCategorySegue{
            if let destinationVC = segue.destination as? CategoryViewController {
                DispatchQueue.main.async {
                    let selectedIndex = sender as! NSIndexPath
                    let selectedCategory = categoriesList[selectedIndex.row]
                    destinationVC.categoryName!.text = selectedCategory.categoryName
                    destinationVC.categoryManager.prepareProductsList(from: self.products, belongingTo: selectedCategory)
                    
                    print("Category is \(selectedCategory.categoryName)")
                    
                }
            }
        }else if segue.identifier == K.homeToProductSegue{
            if let destinationVC = segue.destination as? ProductViewController {
                let selectedRow = sender as! NSIndexPath
                let selectedProduct = productsList[selectedRow.row]
                destinationVC.productName.text = selectedProduct.name
                destinationVC.productImage.image = selectedProduct.image
                destinationVC.describtion.text = selectedProduct.description
                destinationVC.ratingBar.rateValue = Int(selectedProduct.rating)
                destinationVC.priceLabel.text = String(selectedProduct.price)
            }
        }
    }
    
    
}

//MARK:- Product Manager Delegate Section
extension HomeViewController: ProductsListDelegate{
    
    func didFinishParsingData(with list: [Product]) {
        DispatchQueue.main.async {
            self.products = list
            productsList = list
            self.categoriesCollectionView.reloadData()
            self.foldersCollectionView.reloadData()
            self.shopByBrandsCollectionView.reloadData()
            self.topSellingProductsCollectionView.reloadData()
        }
        
    }
}
