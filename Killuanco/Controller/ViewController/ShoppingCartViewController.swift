//
//  ShoppingCartViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    let shoppingList: [Product] =
        [Product(name: "Cat Food", price: 20, quantity: 5),
         Product(name: "Dog Food", price: 30, quantity: 2),
         Product(name: "Dog Food", price: 30, quantity: 2),
         Product(name: "Dog Food", price: 30, quantity: 2),
         Product(name: "Dog Food", price: 30, quantity: 2),]
    
    
    let mayLikeList: [Product] =
        [Product(name: "Doggy food", price: 12),
         Product(name: "Cat Food", price: 15),
         Product(name: "Turtles Food", price: 20),
         Product(name: "Birds Food", price: 20)]

    
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var shoppingCartTableView: UITableView!
    @IBOutlet weak var mayLikeCollectionView: UICollectionView!
    @IBOutlet weak var promoCodeTextField: UITextField!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var deliveryCharges: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mayLikeCollectionView.dataSource = self
        mayLikeCollectionView.delegate = self
        
        mayLikeCollectionView.register(UINib(nibName: K.productsInCollectionViewNibName, bundle: nil), forCellWithReuseIdentifier: K.productsInCollectionViewCellIdentifier)
        
        
        
        shoppingCartTableView.dataSource = self
        shoppingCartTableView.delegate = self
        
        shoppingCartTableView.register(UINib(nibName: K.productsInShoppingTableNibName, bundle: nil), forCellReuseIdentifier: K.productsInShoppingTableCellIdentifier)
        
        
        shoppingCartTableView.rowHeight = 77
        tableViewHeight.constant = CGFloat(shoppingList.count)*shoppingCartTableView.rowHeight
        
        
    }
    
    @IBAction func proceedToCheckoutPressed(_ sender: Any) {
    }
    

}

//MARK:- Shopping Cart Table View Function
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingCartTableView.dequeueReusableCell(withIdentifier: K.productsInShoppingTableCellIdentifier, for: indexPath) as! ShoppingCartTableViewCell
        
        cell.config(withProduct: shoppingList[indexPath.row])
        self.shoppingCartTableView.rowHeight = cell.cellHeight.constant

    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

//MARK:- Shopping Cart May Like Products Function
extension ShoppingCartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mayLikeList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mayLikeCollectionView.dequeueReusableCell(withReuseIdentifier: K.productsInCollectionViewCellIdentifier, for: indexPath) as! ProductInCollectionViewCellViewController

        cell.config(with: mayLikeList[indexPath.row])
        return cell
    }
    
    


}


