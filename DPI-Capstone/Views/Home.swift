//
//  Onboarding.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI

struct Home: View {
    @State var userProfile: UserProfile
    
    var body: some View {
        ZStack{
            Color.offWhite
                .ignoresSafeArea()
            VStack{

                Spacer()
                Text("Opportunities Near You")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(Color.darkerGreen)
                    .padding()
                
                ScrollView {LazyVStack(spacing: 20) {
                                ForEach(filteredOpportunities){
                                    opportunity in OpportunityCard(opportunity: opportunity)
                                        }
                                    }
                .padding()
            
                }
            }
        }
        
      
    }
}

#Preview {
    Home(userProfile: UserProfile(name: "Alina", lat: 41.88, long: -87.62, interests: [.artMusic, .humanService, .animalWelfare], mileRadius: 20.0, age: 16))
}
