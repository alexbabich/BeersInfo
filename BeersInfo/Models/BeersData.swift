//
//  BeersData.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

struct BeersData: Identifiable {
    var id: ObjectIdentifier
    let beers: [Beer]
}
