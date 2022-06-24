//
//  ProductsManager.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/18/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit


protocol ProductsListDelegate {
    
    func didFinishParsingData(with list: [Product])
    
}

struct ProductsListManager {
    
    var delegate : ProductsListDelegate?
    
    func fetchingProductsList(from url: String){
        //        var list : [Product] = []
        //1- Create URL
        if let safeURL = URL(string: url){
            //2- Create Session
            let session = URLSession(configuration: .default)
            //3- Give URL Session a Task
            let task = session.dataTask(with: safeURL) { (data, response, error) in
                //Error Handling//
                if error != nil{
                    print(error!)
                    return
                }
                //Data Handling//
                if let safeData = data {
                    do{
                        let list = try JSONDecoder().decode([APIProduct].self, from: safeData)
                        self.convertIntoProductsList(from: list)
                        
                        
                    }catch{
                        print(error)
                    }
                    
                }else{
                    print("Error Fetching Data")
                }
            }
            //4- Resume Task.
            task.resume()
        }
    }
    
    
    func convertIntoProductsList (from APIProductsList: [APIProduct]){
        var list = [Product]()
        for product in APIProductsList{
                            var newProduct = Product(with: product)
            var productImage = UIImage(named: K.imagePlaceHolder)
                if let url = URL(string: product.image){
                    print(product.image)
                    do{
                        let imageData = try Data(contentsOf: url)
                        if let loadedImage = UIImage(data: imageData){
                            DispatchQueue.main.async {
                                productImage = loadedImage
                                newProduct.image = productImage!
                                list.append(newProduct)
                            }
                        }else{
                            print("Couldn't Load Image from Data")
                        }
                        
                    }catch{
                        print(error)
                        list.append(newProduct)
                    }
                    }else{
                        print("Error Unwrapping the image URL!!")
                    list.append(newProduct)
                    }
            }
        self.delegate?.didFinishParsingData(with: list)
        }
        
    }

