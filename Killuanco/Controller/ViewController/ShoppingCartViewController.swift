//
//  ShoppingCartViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/31/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import SwipeCellKit

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
    

    var shoppingCartList : [Product]?
//    var safeShoppingCartList : [Product]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.shoppingCartList == nil{
            print("Empty Shopping List!! Will add Products list instead!")
        self.shoppingCartList = productsList
        }
        tableViewHeight.constant = CGFloat(productsList.count * (79)) * K.conversionIndex
        collectionViewHeight.constant = 250 * K.conversionIndex
        
        
        mayLikeCollectionView.dataSource = self
        mayLikeCollectionView.delegate = self
        mayLikeCollectionView.register(UINib(nibName: K.productView, bundle: nil), forCellWithReuseIdentifier: K.productView)
        
        
        shoppingCartTableView.dataSource = self
        shoppingCartTableView.delegate = self
        
        shoppingCartTableView.register(UINib(nibName: K.productCell, bundle: nil), forCellReuseIdentifier: K.productCell)
        
        
    }
    
    @IBAction func proceedToCheckoutPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.cartToProductSegue {
            if let destinationVC = segue.destination as? ProductViewController
            {
                let selectedProduct = sender as! IndexPath
                print(selectedProduct)
                print(selectedProduct.row)
                print(selectedProduct.item)
                destinationVC.config(with: shoppingCartList![selectedProduct.item])
                
//                destinationVC.productName?.text = shoppingCartList![selectedProduct.item].name
//                destinationVC.productImage? = shoppingCartList![selectedProduct.item].image
//                destinationVC.priceLabel?.text = String(shoppingCartList![selectedProduct.item].price)
                
                
            }
        }
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == K.cartToProductSegue {
//            //in case stock changed!!
//            return false
//        }
//        //Else case
//        return true
//    }
}

//MARK:- Shopping Cart Table View Function
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate{
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        guard orientation == .right
            else {
                return nil
                
        }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
        }
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingCartList!.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingCartTableView.dequeueReusableCell(withIdentifier: K.productCell, for: indexPath) as! productCell
            cell.config(withProduct: shoppingCartList![indexPath.row])
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 77*K.conversionIndex
        return height
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: K.cartToProductSegue, sender: indexPath)
    }
  
    
}

//MARK:- Shopping Cart May Like Products Function
extension ShoppingCartViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mayLikeCollectionView.dequeueReusableCell(withReuseIdentifier: K.productView, for: indexPath) as! productView
        
        cell.config(with: shoppingCartList![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 177 * K.conversionIndex
        let height = 250 * K.conversionIndex
        return CGSize(width: width, height: height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        self.performSegue(withIdentifier: K.cartToProductSegue, sender: indexPath)
    }



}
