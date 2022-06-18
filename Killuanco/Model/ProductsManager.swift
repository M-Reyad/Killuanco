//
//  ProductsManager.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/18/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation

struct ProductsManager {
    
    func fetchingProductsList(from url: String) -> [Product]{
        var list : [Product] = []
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
                        list = try JSONDecoder().decode([Product].self, from: safeData)
                        print("2nd \(list.count)")
                    }catch{
                        print(error)
                    }
                    
                }else{
                    print("Error Fetching Data")
                }
                print("3rd \(list.count)")
            }
            //4- Resume Task.
            task.resume()
        }
        print("4th \(list.count)")
        return list
    }
//
//    func fetchingData(with productsData : [Product]){
//
//    }
    
}
