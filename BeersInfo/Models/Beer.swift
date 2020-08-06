//
//  Beer.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

struct Beer: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let description: String
    let image_url: String
    let contributed_by: String
    let brewers_tips: String
    let first_brewed: String
    let abv: Double
}
