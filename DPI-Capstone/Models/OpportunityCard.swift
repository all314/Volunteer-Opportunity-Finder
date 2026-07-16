//
//  OpportunityCard.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/15/26.
//

import SwiftUI

struct OpportunityCard: View {
    
    let opportunity: Opportunity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            
            Image(opportunity.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 100, alignment: .leading)
            
            Text(opportunity.organization)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color.darkerGreen)
            
            HStack(alignment: .top, spacing: 24) {
                
                InfoSection(
                    icon: "mappin",
                    lines: [
                        "\(haversine(lat1: 37.7749, long1: -122.4194, lat2: 37.7749, long2: -122.4194)) miles away",
                        "67 Wabash Ave",
                        "Chicago, IL"
                    ]
                )
                
                InfoSection(
                    icon: "clock",
                    lines: ["7:00 AM - 5:00 PM"
                    ]
                )
            }
            
            Text("Description:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.darkerGreen)
            
            Text(opportunity.description)
                .foregroundStyle(Color.darkerGreen)
            
            Spacer()
        }
        .padding(26)
        .frame(maxWidth: .infinity, minHeight: 520, alignment: .topLeading)
        .background {
            RoundedRectangle(cornerRadius: 18)
                .fill(.white)
                .shadow(
                    color: .black.opacity(0.18),
                    radius: 5,
                    x: 3,
                    y: 5
                )
        }
        .padding(.horizontal, 20)
    }
    
    struct InfoSection: View {
        
        let icon: String
        let lines: [String]
        
        var body: some View {
            HStack(alignment: .top, spacing: 12) {
                
                Image(systemName: icon)
                    .font(.system(size: 38))
                    .foregroundStyle(Color.darkerGreen)
                    .frame(width: 42)
                
                VStack(alignment: .leading, spacing: 3) {
                    ForEach(lines, id: \.self) { line in
                        Text(line)
                    }
                }
                .foregroundStyle(Color.darkerGreen)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
#Preview {
    OpportunityCard(opportunity: Opportunities[7])
}
