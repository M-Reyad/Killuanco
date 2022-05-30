//
//  FavouritesViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit


class FavouritesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let favoritesList : [Favorites] = [Favorites(name: "Your Monthly Favorites",
                                                 logo: UIImage(named:"Monthly Folder")!),
                                       Favorites(name: "Your Weekly Favorites",
                                                 logo: UIImage(named: "weeklyfolder")!),
                                       Favorites(name: "Your Weekly Favorites",
                                                 logo: UIImage(named: "weeklyfolder")!),
                                       Favorites(name: "Your Weekly Favorites",
                                                 logo: UIImage(named: "weeklyfolder")!)]

    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesCollectionView.register(UINib(nibName: K.FavoritesNibName, bundle: nil), forCellWithReuseIdentifier: K.FavoritesReuseIdentifier)
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("Returned Number of Items")
        return favoritesList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: K.FavoritesReuseIdentifier, for: indexPath) as! FavoritesCollectionViewCell
        
        
        if indexPath.row < favoritesList.count{
        cell.config(withLabel: favoritesList[indexPath.row].name, withImage: favoritesList[indexPath.row].logo)
        print("Return Cells")
        return cell
        }
        else{
            cell.config(withLabel: "Add New Folder", withImage: UIImage(named: "addIcon")!)
            print("Return Add Icon")
            return cell
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
