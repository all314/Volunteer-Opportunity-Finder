//
//  InterestedOppView.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/24/26.
//

import SwiftUI

struct InterestedOppView: View {
    
    @ObservedObject var userProfile: UserProfile
    
    var interestedOpportunities: [Opportunity] {
        let filtered = Opportunities.filter { opportunity in
            userProfile.interestedOpportunities.contains {
                        $0.id == opportunity.id
                    }
            
        }
        return filtered
    }
    
    var body: some View{
        
        ZStack {
            Color.offWhite
            .ignoresSafeArea()
            
            VStack {
                
                Text("Your Interested Opportunities")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top)
                
                ScrollView {
                    LazyVStack { //but has to filter opportunities that are interested
                        ForEach(interestedOpportunities) { opportunity in
                            OpportunityCard(
                                opportunity: opportunity,
                                userProfile: userProfile, showLog: true
                            )
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
    }


#Preview {
    InterestedOppView(userProfile: UserProfile(
        name: "Advika",
        lat: 41.88,
        long: -87.62,
        interests: [],
        mileRadius: 10,
        age: 17,
        interestedOpportunities: [Opportunities[0], Opportunities[2]],
        hourLog: []))
}
