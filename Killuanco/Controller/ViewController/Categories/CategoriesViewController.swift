//
//  CategoriesViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/10/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    
    @IBOutlet weak var categoriesCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var brandsCollectionViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        brandsCollectionViewHeight.constant *= K.conversionIndex
        
        let categoriesHeight =
            ((categoriesList.count/3)*137) //Height for each Row
            +
            (((categoriesList.count/3)+1)*2) // Height for each space between rows and Lines
        
        categoriesCollectionViewHeight.constant = CGFloat(categoriesHeight)*K.conversionIndex
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        brandsCollectionView.dataSource = self
        brandsCollectionView.delegate = self
        
        brandsCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)
        categoriesCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)

}
    
    
    
}

extension CategoriesViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == brandsCollectionView {
            return brandsList.count
        }else{
            return categoriesList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.categoryView, for: indexPath) as! categoryView
        if collectionView == categoriesCollectionView{
            cell.configForCategory(withCategory: categoriesList[indexPath.row], withTitle: false)
            print("Brands Collection View")
            print(indexPath.row)
            return cell
        } else {
            cell.configForCategory(withCategory: brandsList[indexPath.row], withTitle: true)
            print(indexPath.row)
            return cell
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height, width : CGFloat
        if collectionView == brandsCollectionView{
            height = 70*K.conversionIndex
            width = 111*K.conversionIndex
            return CGSize(width: width, height: height)
        }else{
            height = 137*K.conversionIndex
            width = 109*K.conversionIndex
            return CGSize(width: width, height: height)
        }
    }
    
}
