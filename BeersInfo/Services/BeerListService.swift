//
//  BeerListService.swift
//  BeersInfo
//
//  Created by alex-babich on 05.08.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BeerListService: ObservableObject {
    
    @Published var beers = [Beer]()
    
    func fetchBeers() {
        AF.request("https://api.punkapi.com/v2/beers").responseData { (data) in
            let json = try! JSON(data: data.data!)
            
            for i in json {
                self.beers.append(Beer(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image_url: i.1["image_url"].stringValue))
            }
//            print information about beer from first page 25 item per page
//            print(self.beers)
        }
    }
}
