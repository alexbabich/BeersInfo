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
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.base
            TabView(selection: $selected) {
                BeersListView()
                    .tabItem {
                        Image(systemName: (selected == 0 ? "book.circle.fill" : "book.circle"))
                        Text("List")
                    }.tag(0)
                RandomBeer()
                    .tabItem {
                        Image(systemName: (selected == 1 ? "arrow.2.circlepath.circle.fill" : "arrow.2.circlepath.circle"))
                        Text("Random")
                    }.tag(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
