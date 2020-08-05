//
//  Beer.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

struct Beer: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image_url: String
}
