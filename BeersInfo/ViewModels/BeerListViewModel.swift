//
//  BeerListViewModel.swift
//  BeersInfo
//
//  Created by alex-babich on 05.08.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation


class BeerListViewModel: ObservableObject {
    
    @Published var beers = [Beer]()
    
    func fetchBeers() {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                print(data!)
                self.beers = try! JSONDecoder().decode([Beer].self, from: data!)
            }
        }.resume()
    }
}
