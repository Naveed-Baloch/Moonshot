//
//  ContentView.swift
//  moonshot
//
//  Created by Naveed on 21/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Text("First Screen")
            NavigationLink(
                destination: {
                Image(.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }, label: {
                Image(.image)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            })
            
        }
        .navigationTitle("Navigation in Swift")
        .padding()
    }
}
#Preview {
    ContentView()
}
