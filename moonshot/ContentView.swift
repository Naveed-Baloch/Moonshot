//
//  ContentView.swift
//  moonshot
//
//  Created by Naveed on 21/08/2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink(
                            destination: { MissionView(mission: mission, astronauts: astronauts)},
                            label: { MissionItem(mission: mission) }
                        )
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            
        }
        .preferredColorScheme(.dark)
    }
}


@ViewBuilder
func MissionItem(mission: Mission) -> some View {
    VStack {
        Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
        
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundColor(.white)
            Text(mission.formattedLaunchDate)
                .font(.caption)
            
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Color.lightBackground)
    }
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.lightBackground)
    )
}

#Preview {
    ContentView()
}


