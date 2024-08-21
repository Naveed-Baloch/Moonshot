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
    var body: some View {
        NavigationStack{
            
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """
                
                // Step1
                let data = Data(input.utf8)
                // Step 2
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    print("user object is \(user.name) \(user.address.city)")
                }
                
            }
        }
        
        .padding()
    }
}
#Preview {
    ContentView()
}
