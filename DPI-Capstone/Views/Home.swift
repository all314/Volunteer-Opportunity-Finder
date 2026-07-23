//
//  Onboarding.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI



import SwiftUI

struct Home: View {
    let userProfile: UserProfile

    @State private var sortByDistance = true

    var filteredOpportunities: [Opportunity] {
        let filtered = Opportunities.filter { opportunity in
            userProfile.interests.contains(opportunity.interestTag) &&
            userProfile.age >= opportunity.minimumAge &&
            haversine(
                lat1: userProfile.lat,
                long1: userProfile.long,
                lat2: opportunity.lat,
                long2: opportunity.long
            ) <= userProfile.mileRadius
        }

        if sortByDistance {
            return filtered.sorted {
                haversine(
                    lat1: userProfile.lat,
                    long1: userProfile.long,
                    lat2: $0.lat,
                    long2: $0.long
                ) <
                haversine(
                    lat1: userProfile.lat,
                    long1: userProfile.long,
                    lat2: $1.lat,
                    long2: $1.long
                )
            }
        } else {
            return filtered.sorted {
                $0.date < $1.date
            }
        }
    }

    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
        

            VStack {
                
                Text("Opportunities Near You")
                    .font(.system(size: 32, weight: .bold))
                    .padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.darkerGreen)
                        .frame(width: 365, height: 50)
                        
                    
                    HStack {
                        Text("Sort by:")
                            .foregroundStyle(Color.offWhite)
                            .font(.system(size: 18, weight: .bold))
                            .padding(.leading, 50)
                    
                        Spacer()
                        
                        Button {
                            sortByDistance = true
                        } label: {
                            Text("Distance")
                                .fontWeight(.semibold)
                                .frame(width: 120, height: 30)
                                .background(Color.beige)
                                .foregroundColor(.darkerGreen)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        Button {
                            sortByDistance = false
                        } label: {
                            Text("Date")
                                .fontWeight(.semibold)
                                .frame(width: 70, height: 30)
                                .background(Color.beige)
                                .foregroundColor(.darkerGreen)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                

                ScrollView {
                    LazyVStack {
                        ForEach(filteredOpportunities) { opportunity in
                            OpportunityCard(
                                opportunity: opportunity,
                                userProfile: userProfile
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
