//
//  UserNetworkManager.swift
//  Allle
//
//  Created by Belzi on 11/01/2018.
//  Copyright © 2018 Belzi. All rights reserved.
//

import UIKit

class UserNetworkManager: NSObject {

//    static func checkUser(login: String, password:String){
//
//        let parameters = ["login": login, "password": password]
//        let URLString:String = Constant.getUserURL + "?login=" + login + "&password=" + password
//
//        guard let url = URL(string: URLString) else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
//            return
//        }
//        request.httpBody = httpBody
//
//        URLSession.shared.dataTask(with: request) { (data, response, err) in
//
//            if let data = data{
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//
//                    if(json != nil){
//
//                        let storyboard = UIStoryboard(name: "BaseView", bundle: nil)
//                        guard let viewController = storyboard.instantiateInitialViewController() as? BaseView else{
//                            return
//                        }
//                        present(viewController, animated: true, completion: nil)
//                    }
//
//                }catch{
//                    print(err)
//                }
//            }
//
//        }.resume()
//
//    }
    
}
