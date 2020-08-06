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
        NavigationView {
            VStack {
                HStack {
                    TextField("Type name", text: self.$searchText)
                        .padding(10)
                        .font(Font.system(size: 15, weight: .medium))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 50)
                    
                    Button(action: {
                        self.beersVM.searchBeers(searchName: self.searchText)
                    }) {
                        Text("Search beer")
                    }
                    .padding(10)
                    .foregroundColor(Color.black.opacity(0.7))
                    .background(Color.yellow.opacity(0.5))
                    .cornerRadius(10)
                    .padding(10)
                    .frame(height: 50)
                }
                .padding()
                
                Divider()
                    .background(Color.black.opacity(0.1))
                
                List(beersVM.beersSearch.sorted{ $0.abv < $1.abv } ) { item in
                    NavigationLink(destination: BeerDetailView(beer: item)) {
                        BeersListCellView(item: item)
                    }
                }
                .navigationBarTitle(Text("Search your favorite beer"), displayMode: .inline)
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
