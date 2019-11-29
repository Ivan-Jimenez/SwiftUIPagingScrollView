//
//  ContentView.swift
//  SwiftUIPagingScrollView
//
//  Created by myf on 27/08/2019.
//  Copyright © 2019 Pavel Zak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Drag postion
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    @State var dragChange = 0
    @State var pos: CGFloat = 0
    
    @State private var scrollEffectValue: Double = 13
    @State private var activePageIndex: Int = 0
    
    let tileWidth: CGFloat = UIScreen.main.bounds.size.width
    let tilePadding: CGFloat = 0
    let elements = ["element1", "element2", "element3"]
    let persons = ["person1", "person2", "person3"]
    let fronts = ["front1", "front2", "front3"]
    
    var body: some View {
        
        VStack {
            
        Spacer()
            ZStack {
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.elements.count ,pageWidth: geometry.size.width, tileWidth: self.tileWidth, tilePadding: self.tilePadding) {
                            ForEach(self.elements, id: \.self) { element in
                                Group {
                                    GeometryReader { geometry2 in
                                        Element(image: element)
                                            .offset(y: 100)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                }.offset(x: self.pos/3)
                            }
                        }
                }
                
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.persons.count ,pageWidth:geometry.size.width, tileWidth:self.tileWidth, tilePadding: self.tilePadding){
                        ForEach(self.persons, id: \.self) { person in
                            Group {
                                GeometryReader { geometry2 in
                                    Person(image: person)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }.offset(x: self.pos/2)
                        }
                    }
                }
                
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.fronts.count ,pageWidth: geometry.size.width, tileWidth: self.tileWidth, tilePadding: 0) {
                            ForEach(self.fronts, id: \.self) { front in
                                Group {
                                    GeometryReader { geometry2 in
                                        Front(image: front)
                                            .offset(y: 100)
                                            .aspectRatio(contentMode: .fit)
                                            .gesture(
                                                DragGesture()
                                                    .onChanged { value in
                                                        if (self.activePageIndex == 0 && value.translation.width > 0) || (self.activePageIndex == self.fronts.count-1 && value.translation.width < 0) {
                                                            self.pos = 0
                                                        } else {
                                                            self.pos += value.translation.width
                                                        }
                                                    }
                                                    .onEnded { value in
                                                        self.pos = 0
                                                    }
                                            )
                                    }
                                }.offset(y: 10)
                            }
                        }
                }
            }
        Spacer()
            PageControl(numberOfPages: self.persons.count, currentPageIndex: self.activePageIndex)
                .padding()
        }.background(Color(red: 250/255, green: 250/255, blue: 250/255))
            .edgesIgnoringSafeArea(.all)
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
