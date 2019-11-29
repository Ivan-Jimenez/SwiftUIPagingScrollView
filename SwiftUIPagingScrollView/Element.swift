//
//  Element.swift
//  SwiftUIPagingScrollView
//
//  Created by Alexis Jimenez on 27/11/19.
//  Copyright © 2019 Nerdyak. All rights reserved.
//

import SwiftUI

struct Element: View {
    var image: String
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .frame(height: 330)
            Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
        }.offset(y: -100)
    }
}

struct Element_Previews: PreviewProvider {
    static var previews: some View {
        Element(image: "element1")
    }
}
