//
//  ContentView.swift
//  moonshot
//
//  Created by Naveed on 21/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
