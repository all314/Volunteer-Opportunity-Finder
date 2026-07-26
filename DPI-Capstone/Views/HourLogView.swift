//
//  HourLogView.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/24/26.
//

import SwiftUI

struct HourLogView: View {
    
    var userProfile: UserProfile
    
    var body: some View {
        
        var total: Double {
            
            var total: Double = 0
            
            for entry in userProfile.hourLog{
                total += entry.hours
            }
            return total
        } //computed property for total hours
        
        ZStack{
            Color.offWhite
                .ignoresSafeArea()
            
            VStack{
                Text("Your Volunteer Log")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top)
                
                
                
                if userProfile.hourLog.isEmpty{
                    Spacer() //if no hours logged for the user
                    
                    Image(systemName: "exclamationmark.message.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.darkerGreen)
                        .frame(width: 70, height: 70)
                    
                    Text("Nothing here yet! Try marking opportunities as 'interested' and logging hours for them.")
                    .font(.system(size: 24))
                        .padding()
                        .fontWeight(.medium)
                        .foregroundStyle(.darkerGreen)
                    
                    Spacer()
                    Spacer()
                } else{
                        
                    Text("\(total, specifier: "%.1f") hours volunteered!")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(Color.darkerGreen.opacity(0.25))
                        .foregroundStyle(Color.darkerGreen)
                        .clipShape(Capsule())
                    
                    ScrollView {
                        LazyVStack {
                            //displays log card for each hour logged
                            ForEach(userProfile.hourLog) { entry in
                                LogCard(
                                    entry: entry
                                )
                                
                            }
                        }
                        .padding(.top)
                    }
                }
               
            }
            
            
        }
    }
}

#Preview {
    HourLogView(userProfile: UserProfile(name: "Alina", lat: 48.11, long: 62.87, interests: [], mileRadius: 2, age: 16, interestedOpportunities: [], hourLog: [
        
      loggedHour(organization: "The Grace Network", hours: 2.3, date: Date(), logo: "GraceNetwork"),

      //  loggedHour(organization: "The Clare", hours: 2.1, date: Date(), logo: "Clare")
        
        ]))
}
