//
//  ContentView.swift
//  SwiftUIPagingScrollView
//
//  Created by myf on 27/08/2019.
//  Copyright © 2019 Pavel Zak. All rights reserved.
//

import SwiftUI

struct TileView: View {
    
    let image: String
    
    
    var body: some View {
        VStack {
            ZStack {
//                Rectangle()
//                    .opacity(0.0)
//                    .cornerRadius(20.0)
                Image(image)
//                .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .font(.largeTitle)
            }
        }
    }
}

struct Background: View {
    
    let image: String
    
    var body: some View {
        VStack {
            ZStack {
//                Rectangle()
//                    .opacity(0.0)
//                    .cornerRadius(20.0)
                Image(image)
//                .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView: View {
    @State private var scrollEffectValue: Double = 13
    @State private var activePageIndex: Int = 0
    
    let tileWidth: CGFloat = 450
    let tilePadding: CGFloat = 20
    let elements = ["element1", "element2", "element3"]
    let persons = ["person1", "person2", "person3"]
    
    var body: some View {
        VStack {
            
        Spacer()
            ZStack {
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.elements.count ,pageWidth:geometry.size.width, tileWidth:self.tileWidth, tilePadding: self.tilePadding){
                    ForEach(self.elements, id: \.self) { element in
                        GeometryReader { geometry2 in
                            Element(image: element)
                                .padding(.horizontal, 50.0)
//                                .rotation3DEffect(Angle(degrees: Double((geometry2.frame(in: .global).minX - self.tileWidth*0.5) / -10 )), axis: (x: 2, y: 11, z: 1))
//                                .onTapGesture {
//                                    print ("tap on index: \(index)")
//                                }
                        }
                    }
                }
                }
                
                
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.persons.count ,pageWidth:geometry.size.width, tileWidth:self.tileWidth, tilePadding: self.tilePadding){
                        ForEach(self.persons, id: \.self) { person in
                        GeometryReader { geometry2 in
                            Person(image: person)
                                .padding(.horizontal, 50.0)
//                                .rotation3DEffect(Angle(degrees: Double((geometry2.frame(in: .global).minX - self.tileWidth*0.5) / -10 )), axis: (x: 2, y: 11, z: 1))
                                .gesture(DragGesture()
                                    .onChanged { value in
                                        print("drag change")
                                }   // 4.
                                    .onEnded { value in
                                        print("on end")
                                    }
                            )
                        }
                    }
                }
                }
            }
        Spacer()
            PageControl(numberOfPages: self.persons.count, currentPageIndex: self.activePageIndex)
        }
    }
}

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    
    var currentPageIndex: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray

        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
