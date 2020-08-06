//
//  BeersListView.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct BeersListView: View {
    @ObservedObject var beersVM = BeerListViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(beersVM.beers) { item in
                    NavigationLink(destination: BeerDetailView(beer: item)) {
                        BeersListCellView(item: item)
                    }
                }
            }
            .navigationBarTitle(Text("The most ABV beers (more than 15%)"), displayMode: .inline)
            .onAppear {
                self.beersVM.fetchBeers()
            }
        }
    }
}


struct BeersListView_Previews: PreviewProvider {
    static var previews: some View {
        BeersListView()
    }
}
