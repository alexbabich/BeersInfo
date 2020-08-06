//
//  SearchBeerView.swift
//  BeersInfo
//
//  Created by alex-babich on 06.08.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct SearchBeerView: View {
    @ObservedObject var beersVM = BeersServices()
    
    @State private var searchText : String = ""
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    }
    
    var body: some View {
//        NavigationView {
//            VStack {
//                List(beersVM.beers) { item in
//                    NavigationLink(destination: BeerDetailView(beer: item)) {
//                        BeersListCellView(item: item)
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Search your favorite beer"), displayMode: .inline)
//            .onAppear {
//                self.beersVM.fetchBeers()
//            }
//        }
        
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search cars")
                List {
                    ForEach(self.beersVM.beers.filter {
                        self.searchText.isEmpty ? true : $0.name.lowercased().localizedCaseInsensitiveContains(self.searchText.lowercased())
                    }, id: \.self) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle(Text("Search your favorite beer"), displayMode: .inline)
                .onAppear {
                    self.beersVM.fetchBeers()
                }
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchBeerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBeerView()
    }
}
