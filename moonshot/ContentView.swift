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
                .containerRelativeFrame(.horizontal){ size , axis in
                    size * 0.3
                    
                }
                .containerRelativeFrame(.vertical){ size , axis in
                    size * 0.1
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
