//
//  MissionView.swift
//  moonshot
//
//  Created by Naveed on 22/08/2024.
//

import Foundation
import SwiftUI


struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MissionLogo(image: mission.image)
                CustomDivider(height: 2, backgroundColor: .lightBackground)
                MissionDescriptionView(description: mission.description)
                CrewView(crew: crew)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct CustomDivider : View {
    let height: CGFloat
    let backgroundColor: Color
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundStyle(backgroundColor)
            .padding(.vertical)
    }
}

@ViewBuilder
func CrewView(crew: [MissionView.CrewMember]) -> some View {
    Text("Crew")
        .font(.title.bold())
        .padding(.bottom, 5)
    
    ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(crew, id: \.role) { crewMember in
                NavigationLink {
                    AstronautView(astronaut: crewMember.astronaut)
                } label: {
                    HStack {
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            Text(crewMember.role)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding([.vertical, .trailing])
                    }
                    
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.lightBackground, lineWidth: 2)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

struct MissionDescriptionView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)
            
            Text(description)
        }
        .padding(.horizontal)
    }
}

struct MissionLogo: View {
    let image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { width, axis in
                width * 0.6
            }
            .padding(.top)
    }
}
