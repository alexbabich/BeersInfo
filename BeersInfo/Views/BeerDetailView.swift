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
//    var beer: Beer
    
    var body: some View {
        VStack {
            HStack {
                //            AnimatedImage(url: URL(string: beer.image_url)!)
                Image("88")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .shadow(radius: 10)

                Text("beer.name")
                    .font(.title)
                
                Spacer()

            }

            VStack(alignment: .leading) {
                
                Text("beer.description")
                    .font(.subheadline)
                
                Spacer()
                
            }
        }
        .padding()
        .navigationBarTitle(Text("beer.name"), displayMode: .inline)
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView()
    }
}
