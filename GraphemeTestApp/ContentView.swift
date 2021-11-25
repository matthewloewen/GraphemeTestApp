//
//  ContentView.swift
//  GraphemeTestApp
//
//  Created by Matthew Loewen on 2021-06-08.
//

import SwiftUI

struct ContentView: View {
    let defaultGraphemes = ["aSound", "bb", "aSound", "bb", "aSound", "bb", "aSound", "bb"]
    
    @State private var graphemes: [String] = []
    
    var body: some View {
        VStack {
            // spacer to center the view
            Spacer()
            
            // Start of SwiftUI example
            Text("SwiftUI")
                .font(.title)
            
            Text("\"a\" and \"bb\" are different sizes when images resize")
            
            HStack {
                ForEach(graphemes, id:\.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.green)
            
            
            // start of UIKit example
            Text("UIKit")
                .font(.title)
                .padding(.top)
            
            Text("\"a\" and \"bb\" resize consistently")
            
            GraphemeView(graphemes: $graphemes)
                .frame(maxHeight: 100)
                .background(Color.yellow)
            
            Spacer()
            
            
            // buttons to control which graphemes are shown
            HStack(spacing: 20) {
                Button(action: addA, label: {
                    Image("aSound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                })
                
                Button(action: addBB, label: {
                    Image("bb")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                })
                
                Button(action: resetGraphemes, label: {
                    Text("Reset")
                })
                
                Button(action: clearGraphemes, label: {
                    Text("Clear")
                })
            }
        }
        .onAppear(perform: {
            resetGraphemes()
        })
    }
    
    func addA() {
        graphemes.append("aSound")
    }
    
    func addBB() {
        graphemes.append("bb")
    }
    
    func resetGraphemes() {
        graphemes = defaultGraphemes
    }
    
    func clearGraphemes() {
        graphemes = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
