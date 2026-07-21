//
//  OpportunityCard.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/15/26.
//

import SwiftUI

struct OpportunityCard: View {
    
    let opportunity: Opportunity
    
    let userProfile: UserProfile
    
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
                        //formats the mile distance, and adds the address of the organization.
                        String(format: "%.1f miles away", haversine(lat1: userProfile.lat, long1: userProfile.long, lat2: opportunity.lat, long2: opportunity.long)),
                        "\(opportunity.address)"
                    ]
                )
                
                InfoSection(
                    
                    //the times of the opportunity
                    
                    icon: "clock",
                    lines: [opportunity.date
                    ]
                )
            }
            
            Text("Description:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.darkerGreen)
            
            Text(opportunity.description)
                .foregroundStyle(Color.darkerGreen)
            
            
            HStack{
                //why aren't the icons showing up?
                Image(systemName: "link")
                Link("Website Link", destination: URL(string: "\(opportunity.website)")!)
            }
            
            HStack{
                Image(systemName: "envelope.badge.person.crop.fill")
                    .padding(.vertical, 2)
                Link("Contact Info", destination: URL(string: "\(opportunity.contact)")!)
            }
            
            
            
            
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
                            .font(.system(size: 16))
                    }
                }
                .foregroundStyle(Color.darkerGreen)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
#Preview {
    OpportunityCard(opportunity: Opportunities[7], userProfile: UserProfile(name: "Alina", lat: 41.88, long: -87.62, interests: [.humanService, .healthcare], mileRadius: 15, age: 16))
}
