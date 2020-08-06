//
//  ContentView.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selected) {
                BeersListView()
                    .tabItem {
                        Image(systemName: (selected == 0 ? "book.circle.fill" : "book.circle"))
                        Text("ABV beers")
                    }.tag(0)
                RandomBeer()
                    .tabItem {
                        Image(systemName: (selected == 1 ? "arrow.2.circlepath.circle.fill" : "arrow.2.circlepath.circle"))
                        Text("Random")
                    }.tag(1)
                
                SearchBeerView()
                    .tabItem {
                        Image(systemName: (selected == 2 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle"))
                        Text("Search")
                    }.tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
