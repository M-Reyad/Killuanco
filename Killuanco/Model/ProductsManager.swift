//
//  ProductsManager.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 6/18/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation

protocol ProductsManagerDelegate {
    func didFinishFetchingData(with list: [Product])
}

struct ProductsManager {
    
    var delegate : ProductsManagerDelegate?
    
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
                        let list = try JSONDecoder().decode([Product].self, from: safeData)
//                        print(list)
                        print("List is fetched with count \(list.count)")
                    self.delegate?.didFinishFetchingData(with: list)
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

    func parsingJSON(){
        
    }
    
}
