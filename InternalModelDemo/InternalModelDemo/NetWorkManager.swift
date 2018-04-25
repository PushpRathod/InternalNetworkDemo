//
//  NetWorkManager.swift
//  InternalModelDemo
//
//  Created by pushp on 3/20/18.
//  Copyright © 2018 pushp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {

        static let sharedInstance =  NetworkManager()
    
    func callAPIWithURL(_ url: String, parameter:Dictionary<String, Any>?, completionHandler: @escaping(_ response:[MainModel]) -> Void) {
//
//        let headers: HTTPHeaders = [
//            "Content-Type" :"application/json"
//        ]
//
        request(url, method: HTTPMethod.get, parameters: parameter , encoding: URLEncoding.default, headers: nil).responseJSON { (response: DataResponse) in
//            print("response is \(response)")
//            if response.response?.statusCode == 200 {
//                if let json = response.data {
//                     let data = JSON(data: json)
//                    print("data\(data["RestResponse"]["result"])")
//                }
//            }
            
            let json = try! JSON(data: response.data!)
            let name = json["RestResponse"]
            let results = name["result"]
            let data1 = results[0]
            print("0: \(data1)")
            print(name[0]["country"])
            
            var arrData = [MainModel]()
            for  _ in results.arrayValue {
                   let objectData = try! JSONDecoder().decode(MainModel.self, from: response.data!)
                arrData.append(objectData)
                print(objectData.id)
//                let str = objData["country"].stringValue
//                print(str)

            }
            
            
//            for single in name {
//                print(single["name"])
//            }
            
            
            
            switch response.result {
            case .success(let JSON):
                print("Success with JSON: \(JSON)")
                
//                let response = JSON as! Dictionary<String, Any>
//
//                //example if there is an id
//                let userId:Dictionary<String, Any> = response["RestResponse"] as! Dictionary<String, Any>
//                print(userId["result"])
                
                
                

                completionHandler(arrData)
                
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
        
    }
    
}
