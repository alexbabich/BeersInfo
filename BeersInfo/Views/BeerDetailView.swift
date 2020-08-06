//
//  BeerDetailView.swift
//  BeersInfo
//
//  Created by alex-babich on 05.08.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BeerDetailView: View {
    var beer: Beer

    @State private var beerAbv = ""
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                
                if (beer.image_url == "") {
                    Text("No image")
                        .frame(maxWidth: 200, maxHeight: 200)
                } else {
                 AnimatedImage(url: URL(string: beer.image_url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400, maxHeight: 400)
                    .shadow(radius: 10)
                }

                VStack(alignment: .leading) {
                    Text(beer.name)
                        .font(.system(size: 26))
                        .fontWeight(.medium)
                    
                    Divider()
                        .background(Color.black.opacity(0.6))
                        .padding(.bottom, 15)
                    
                    Text("manufactured \(beer.contributed_by), since \(beer.first_brewed)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
            }
            .frame(height: 250)

            VStack(alignment: .leading) {
                
                HStack {
                    Text("ABV:")
                        .bold()
                    
                    Text(self.trailingZero(temp: beer.abv))
                }
                .padding(.bottom, 10)
                
                Divider()
                    .background(Color.black.opacity(0.6))
                    .padding(.bottom, 25)
                
                Text("Description:")
                    .bold()
                    .padding(.bottom, 10)
                
                
                Text(beer.description)
                    .font(.subheadline)
                    .padding(.bottom, 25)
                
                Divider()
                    .background(Color.black.opacity(0.6))
                    .padding(.bottom, 25)
                
                Text("Brewers advice:")
                    .bold()
                    .padding(.bottom, 10)
                
                Text(beer.brewers_tips)
                    .font(.subheadline)
                    .padding(.bottom, 25)
            }
            .padding()
        }
        .padding()
        .navigationBarTitle(Text(beer.name), displayMode: .inline)
    }
    
    func trailingZero(temp: Double) -> String {
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
}

// preview with some dummy data for testing

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView(beer: Beer(id: 1, name: "The End Of History", description: "A new 4.7% ABV American pale ale, Jinx Pale Ale is one of the core Fanzine beers, and will feature evolving editions as part of our new subscription model.A new 4.7% ABV American pale ale, Jinx Pale Ale is one of the core Fanzine beers, and will feature evolving editions as part of our new subscription modelA new 4.7% ABV American pale ale, Jinx Pale Ale is one of the core Fanzine beers, and will feature evolving editions as part of our new subscription modelA new 4.7% ABV American pale ale, Jinx Pale Ale is one of the core Fanzine beers, and will feature evolving editions as part of our new subscription model", image_url: "https://images.punkapi.com/v2/24.png", contributed_by: "Sam Mason <samjbmason>", brewers_tips: "You'll have to get this one all the way down to -70°C. Taxidermy is not optional.", first_brewed: "2017", abv: 13.2))
    }
}
