//
//  FavouritesViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class FavouritesViewController: UIViewController {

    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Optimizing CollectionView Heigh//
        collectionViewHeight.constant = CGFloat(Double(foldersList.count * 177))
        
        
        //Registering Nib//
        favoritesCollectionView.register(UINib(nibName: K.categoryView, bundle: nil), forCellWithReuseIdentifier: K.categoryView)
        
        //Registering Data Source and Delegates//
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
    }
    
}
extension FavouritesViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foldersList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: K.categoryView, for: indexPath) as! categoryView
        
        if indexPath.row < foldersList.count-1{
            cell.configForCategory(withCategory: foldersList[indexPath.row], withTitle: false)
        print("Return Cells")
        return cell
        }
        else{
            cell.configForCategory(withCategory: foldersList[indexPath.row], withTitle: false)
            print("Return Add Icon")
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 177*K.conversionIndex
        let width = 176*K.conversionIndex
        
        return CGSize(width: width, height: height)
    }

}
