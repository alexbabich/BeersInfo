//
//  BeersServices.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BeersRandomServices: ObservableObject {
    
    @Published var datas = [Beer]()
    
    init() {
        AF.request("https://api.punkapi.com/v2/beers/random").responseData { (data) in
            let json = try! JSON(data: data.data!)
            
            for i in json {
                self.datas.append(Beer(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, imageUrl: i.1["image_url"].stringValue))
            }
            
            print(self.datas)
        }
    }
}
