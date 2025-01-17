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

class BeersServices: ObservableObject {
    
    @Published var datas = [Beer]()
    @Published var beers = [Beer]()
    @Published var beersSearch = [Beer]()
    
    
//    Returns random beer
    func fetchRandom() {
        AF.request("https://api.punkapi.com/v2/beers/random").responseData { (data) in
            let json = try! JSON(data: data.data!)
            self.datas.removeAll()
            
            for i in json {
                self.datas.append(Beer(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image_url: i.1["image_url"].stringValue, contributed_by: i.1["contributed_by"].stringValue, brewers_tips: i.1["brewers_tips"].stringValue, first_brewed: i.1["first_brewed"].stringValue, abv: i.1["abv"].doubleValue, ibu: i.1["ibu"].doubleValue, srm: i.1["srm"].doubleValue, ebc: i.1["ebc"].doubleValue))
            }
//            print(self.datas)
        }
    }
    
    
//    Returns all beers with ABV greater than the supplied number
        func fetchBeers() {
            AF.request("https://api.punkapi.com/v2/beers?abv_gt=15").responseData { (data) in
                let json = try! JSON(data: data.data!)
                self.beers.removeAll()
                
                for i in json {
                    self.beers.append(Beer(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image_url: i.1["image_url"].stringValue, contributed_by: i.1["contributed_by"].stringValue, brewers_tips: i.1["brewers_tips"].stringValue, first_brewed: i.1["first_brewed"].stringValue, abv: i.1["abv"].doubleValue, ibu: i.1["ibu"].doubleValue, srm: i.1["srm"].doubleValue, ebc: i.1["ebc"].doubleValue))
                }
            }
        }
    
        
        
//    Returns all beers for search with parameter
    func searchBeers(searchName: String) {
            let parameters = ["beer_name": searchName]
            AF.request("https://api.punkapi.com/v2/beers", parameters: parameters).responseData { (data) in
                let json = try! JSON(data: data.data!)
                self.beersSearch.removeAll()
                
                for i in json {
                    self.beersSearch.append(Beer(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image_url: i.1["image_url"].stringValue, contributed_by: i.1["contributed_by"].stringValue, brewers_tips: i.1["brewers_tips"].stringValue, first_brewed: i.1["first_brewed"].stringValue, abv: i.1["ibu"].doubleValue, ibu: i.1["abv"].doubleValue, srm: i.1["srm"].doubleValue, ebc: i.1["ebc"].doubleValue))
                }
    //            print(self.beersSearch)
            }
        }
}
