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
        Image(image)
        .resizable()
            .frame(width: 450, height: 450)
            .aspectRatio(contentMode: .fill)
        .clipped()
    }
}

struct Element_Previews: PreviewProvider {
    static var previews: some View {
        Element(image: "element1")
    }
}
