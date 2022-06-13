//
//  ShoppingCartViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
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
        
        mayLikeCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
        
        
        
        shoppingCartTableView.dataSource = self
        shoppingCartTableView.delegate = self
        
        shoppingCartTableView.register(UINib(nibName: K.productCell, bundle: nil), forCellReuseIdentifier: K.productCell)
        
        
        shoppingCartTableView.rowHeight = 77
        tableViewHeight.constant = CGFloat(productsList.count)*shoppingCartTableView.rowHeight
        
        
    }
    
    @IBAction func proceedToCheckoutPressed(_ sender: Any) {
    }
    

}

//MARK:- Shopping Cart Table View Function
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingCartTableView.dequeueReusableCell(withIdentifier: K.productCell, for: indexPath) as! ShoppingCartTableViewCell
        
        cell.config(withProduct: productsList[indexPath.row])
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
        return productsList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mayLikeCollectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! ProductInCollectionViewCellViewController

        cell.config(with: productsList[indexPath.row])
        return cell
    }
    
    


}


