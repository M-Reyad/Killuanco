//
//  HomeViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
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
    var productManager = ProductsManager()
    
    //    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1st\(productsList.count)")
        DispatchQueue.main.async {
            productsList = self.productManager.fetchingProductsList(from: "https://killuandco.herokuapp.com/api/?format=json")
            print("5th \(productsList.count)")
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
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        topSellingProductsCollectionView.dataSource = self
        topSellingProductsCollectionView.delegate = self
        
        shopByBrandsCollectionView.dataSource = self
        shopByBrandsCollectionView.delegate = self
        
        foldersCollectionView.dataSource = self
        foldersCollectionView.delegate = self
        
        
    }
    
    
    //View Controller Buttons Actions//
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categorySegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categorySegue"{
            if let destinationVC = segue.destination as? CategoryViewController{
                let selectedCategory = sender as! NSIndexPath
                destinationVC.products = categoriesList[selectedCategory.row].products
            }
        }
    }
}

