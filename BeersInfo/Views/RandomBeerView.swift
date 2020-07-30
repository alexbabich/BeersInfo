//
//  RandomBeer.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import UIImageColors

struct RandomBeer: View {
//    @ObservedObject private var vm = RandomBeerViewModel()
//    
//    init() {
//        vm.getRandomBeer()
//    }
    
    @ObservedObject var beerRandom = BeersRandomServices()
    
    @State private var backgroundColor: Color = .clear
    
    @State private var textColor: Color = .clear
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(beerRandom.datas) { i in
                GeometryReader { geometry in
                    VStack {
                        Text("Beer Info")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                        
                        if i.imageUrl != "" {
                            AnimatedImage(url: URL(string: i.imageUrl)!)
                                .resizable()
                                .frame(width: 100, height: 300)
                                .scaledToFill()
                        } else {
                            Image(systemName: "photo")
                        }
                        
                        Text(i.name)
                            .padding()
                            .foregroundColor(self.textColor)
                            .colorInvert()
                        
                        Text(i.description)
                            .padding()
                            .foregroundColor(self.textColor)
                            .colorInvert()
                        
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                .background(self.backgroundColor)
                .onAppear {
                    self.setAverageColor(imageString: i.imageUrl)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func setAverageColor(imageString: String) {
        if imageString != "" {
            let imageUrl = URL(string: imageString)!

            let uiColor = try? UIImage(withContentsOfUrl: imageUrl)?.averageColor ?? .clear
            print(uiColor as Any)
            self.backgroundColor = Color(uiColor!)
            self.textColor = Color(uiColor!)
        }
    }
}

struct RandomBeer_Previews: PreviewProvider {
    static var previews: some View {
        RandomBeer()
    }
}

public struct UIImageColors {
    public var background: UIColor!
    public var primary: UIColor!
    public var secondary: UIColor!
    public var detail: UIColor!
}
