//
//  BeerViewModel.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

struct BeerViewModel: Identifiable {
    var id: UUID {
        return UUID()
    }
    
    private let beer: Beer
    
    var name: String {
        return beer.name
    }
    
    var description: String {
        return beer.description
    }
    
    var image_url: String {
        return beer.image_url
    }
    
    var contributed_by: String {
        return beer.contributed_by
    }
    
    var brewers_tips: String {
        return beer.brewers_tips
    }
    
    var first_brewed: String {
        return beer.first_brewed
    }
    
    var abv: Double {
        return beer.abv
    }
    
    var ibu: Double {
        return beer.ibu
    }
    
    var srm: Double {
        return beer.ibu
    }
    
    var ebc: Double {
        return beer.ibu
    }
    
    init(_ beer: Beer) {
        self.beer = beer
    }
}
