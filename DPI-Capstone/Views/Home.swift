//
//  Onboarding.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI

struct Home: View {
    @ObservedObject var userProfile: UserProfile
    @State var sortByDistance: Bool = true
    var showLog: Bool = false

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
                
                HStack(spacing: 24) {
                    NavigationLink {
                        InterestedOppView(userProfile: userProfile)
                    } label: {
                        VStack(spacing: 5) {
                            Image(systemName: "heart")
                                .font(.title3)

                            Text("Interested")
                                .font(.caption)
                        }
                    }

                    NavigationLink {
                        HourLogView(userProfile: userProfile)
                    } label: {
                        VStack(spacing: 5) {
                            Image(systemName: "clock")
                                .font(.title3)

                            Text("Hour Log")
                                .font(.caption)
                        }
                    }
                }
                .foregroundStyle(Color.darkerGreen)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 28)
                .fontWeight(.semibold)
                
                
                Text("Opportunities Near You")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top)

                
                
                if !filteredOpportunities.isEmpty{
                    
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
                } else{
                        
                    VStack(alignment: .center){
                        Spacer()
                        
                        Image(systemName: "exclamationmark.message.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(.darkerGreen)
                            .frame(width: 70, height: 70)
                        
                        
                            Text("No match found! Try updating your parameters.")
                            .font(.system(size: 24))
                                .padding()
                                .fontWeight(.semibold)
                                .foregroundStyle(.darkerGreen)
                        Spacer()
                        Spacer()
                    }
                    
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
            interests: [.animalWelfare, .artMusic],
            mileRadius: 20.0,
            age: 16,
            interestedOpportunities: [],
            hourLog: []
        )
    )
}
