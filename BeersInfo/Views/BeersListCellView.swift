//
//  BeersListCellView.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BeersListCellView: View {
    
    var item: Beer
    
    var body: some View {
        HStack {
            if item.image_url != "" {
                AnimatedImage(url: URL(string: item.image_url)!)
                    .resizable()
                    .frame(width: 50, height: 125)
                    .scaledToFill()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
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

