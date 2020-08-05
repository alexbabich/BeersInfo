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
    
    var body: some View {
        NavigationView {
            VStack {
                List(beersVM.beers) { item in
                    NavigationLink(destination: BeerDetailView()) {
                        BeersListCellView(item: item)
                    }
                }
            }
            .navigationBarTitle(Text("First 25 beers"))
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
