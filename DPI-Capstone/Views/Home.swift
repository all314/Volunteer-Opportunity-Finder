//
//  Onboarding.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI

struct Home: View {
    let userProfile: UserProfile

    var filteredOpportunities: [Opportunity] {
        Opportunities.filter { opportunity in
            userProfile.interests.contains(opportunity.interestTag) &&
            userProfile.age >= opportunity.minimumAge &&
            haversine(
                lat1: userProfile.lat,
                long1: userProfile.long,
                lat2: opportunity.lat,
                long2: opportunity.long
            ) <= userProfile.mileRadius
        }
    }

    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Opportunities Near You")
                    .font(.system(size: 32, weight: .bold))
                    .padding()

                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredOpportunities) { opportunity in
                            OpportunityCard(opportunity: opportunity, userProfile: userProfile)
                        }
                        
                        if filteredOpportunities.isEmpty {
                            Text("No opportunities match your filters. Try changing your interests.")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    Home(
        userProfile: UserProfile(
            name: "Alina",
            lat: 41.88,
            long: -87.62,
            interests: [.artMusic, .animalWelfare],
            mileRadius: 20.0,
            age: 16
        )
    )
}
