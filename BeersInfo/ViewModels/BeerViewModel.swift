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
    
    init(_ beer: Beer) {
        self.beer = beer
    }
}
