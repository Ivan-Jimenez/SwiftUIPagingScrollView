//
//  Front.swift
//  SwiftUIPagingScrollView
//
//  Created by Alexis Jimenez on 29/11/19.
//  Copyright © 2019 Nerdyak. All rights reserved.
//

import SwiftUI

struct Front: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(y: -100)
    }
}

struct Front_Previews: PreviewProvider {
    static var previews: some View {
        Front(image: "front2")
    }
}
