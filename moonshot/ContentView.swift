//
//  ContentView.swift
//  moonshot
//
//  Created by Naveed on 21/08/2024.
//

import SwiftUI

class User: Codable {
    let name: String
    let address: Address
}

class Address: Codable{
    let street: String
    let city: String
}

struct ContentView: View {
    let layout = [
        GridItem(.fixed(80), alignment: .leading),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
