//
//  ContentView.swift
//  moonshot
//
//  Created by Naveed on 21/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct CustomText: View {
    let value: String
    var body: some View {
        Text(value)
    }
    init(_ text: String) {
        print("Creating new Text \(text)")
        self.value = text
    }
}

#Preview {
    ContentView()
}
