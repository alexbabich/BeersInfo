//
//  ImageFromUrl.swift
//  BeersInfo
//
//  Created by alex-babich on 06.08.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct ImageFromUrl<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
