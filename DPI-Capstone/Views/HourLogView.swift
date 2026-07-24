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
        ZStack{
            Color.offWhite
                .ignoresSafeArea()
            
            VStack{
                Text("Your Volunteer Log")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top)
            }
        }
    }
}

#Preview {
    HourLogView(userProfile: UserProfile(name: "Alina", lat: 48.11, long: 62.87, interests: [], mileRadius: 2, age: 16, interestedOpportunities: [], hourLog: []))
}
