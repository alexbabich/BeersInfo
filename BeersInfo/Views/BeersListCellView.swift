//
//  BeersListCellView.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct BeersListCellView: View {
    
    var item: Beer
    
    var body: some View {
        HStack {
            if item.image_url == "" {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
            } else {
                ImageFromUrl(
                    url: URL(string: item.image_url)!,
                    placeholder: Text("Loading ...")
                )
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 10)
                .frame(width: 50, height: 125)
            }
            
            Text(item.name)
                .font(.title)
                .fontWeight(.light)
                .padding()
            
            Spacer()
        }
        .padding(.vertical)
    }
}

