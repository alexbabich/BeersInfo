//
//  BeersListView.swift
//  BeersInfo
//
//  Created by alex-babich on 30.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct BeersListView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.base
            Text("BeersListView")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BeersListView_Previews: PreviewProvider {
    static var previews: some View {
        BeersListView()
    }
}
