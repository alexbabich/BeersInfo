//
//  RandomBeer.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RandomBeer: View {
    
    @ObservedObject var beerRandomVM = BeersServices()
    @State private var textColor: Color = .clear
    @State private var beerTitle: String = "Beer info"
    
    var body: some View {
        NavigationView {
            ScrollView {
                Color
                    .clear
                    .frame(maxWidth: .infinity, maxHeight: 0)
                ForEach(beerRandomVM.datas) { item in
                    BeerDetailView(beer: item)
                        .padding(.vertical)
                        .onAppear {
                            self.beerTitle = item.name
                            self.setAverageColor(imageString: item.image_url)
                        }
                }
            }
            .navigationBarTitle(Text(self.beerTitle)
                .font(.body)
                .fontWeight(.light), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.beerRandomVM.fetchRandom()
            }, label: {
                Text("Reload")
            }))
        }
        .onAppear {
            self.beerRandomVM.fetchRandom()
        }
    }
    
//    function to get custom color for description and other text
    private func setAverageColor(imageString: String) {
        if imageString != "" {
            let image_url = URL(string: imageString)!

            let uiColor = try? UIImage(withContentsOfUrl: image_url)?.averageColor ?? .clear
            self.textColor = Color(uiColor!)
        }
    }
}

struct RandomBeer_Previews: PreviewProvider {
    static var previews: some View {
        RandomBeer()
    }
}
