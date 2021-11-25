//
//  GraphemeView.swift
//  GraphemeTestApp
//
//  Created by Matthew Loewen on 2021-06-08.
//

import SwiftUI

struct GraphemeView: UIViewControllerRepresentable {
    @Binding var graphemes: [String]
    
    func makeUIViewController(context: Context) -> GraphemeViewController {
        let controller = GraphemeViewController(graphemes: graphemes)
        print("make called")
        
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("update called")
        print("graphemes: \(graphemes)")
        uiViewController.updateGraphemes(with: graphemes)
        
    }
}

struct GraphemeView_Previews: PreviewProvider {
    static var previews: some View {
        GraphemeView(graphemes: .constant(["aSound", "bb", "aSound", "bb", "aSound", "bb", "aSound", "bb"]))
    }
}
