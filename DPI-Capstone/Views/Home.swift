//
//  Onboarding.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI

struct Home: View {
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
    Home()
}
