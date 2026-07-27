//
//  OpportunityCard.swift
//  DPI-Capstone
//

import SwiftUI
import Combine

struct OpportunityCard: View {
    
    @State var opportunity: Opportunity
    @ObservedObject var userProfile: UserProfile
    var showLog: Bool = false
    
    @State private var showLogPrompt = false
    @State private var hours = ""
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            
            // Top section
            HStack(alignment: .top) {
                
                Image(opportunity.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 85, height: 85)
                    .padding(8)
                
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(opportunity.organization)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.darkerGreen)
                    
                    
                    Text(opportunity.interestTag.rawValue)
                        .font(.system(size: 13, weight: .medium))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(Color.darkerGreen.opacity(0.25))
                        .foregroundStyle(Color.darkerGreen)
                        .clipShape(Capsule())
                    
                }
                
                Spacer()
                
                //what button is shown depends on if the user is on the home or interested page
                if !showLog {
                    //like if they're on the home page then the button toggles the interested
                    Button {
                        opportunity.interested.toggle()
                        
                        if opportunity.interested {
                            userProfile.interestedOpportunities.append(opportunity)
                        } else {
                            userProfile.interestedOpportunities.removeAll {
                                $0.id == opportunity.id
                            }
                        }
                        
                    } label: {
                        
                        Text(opportunity.interested ? "✓ Saved" : "♡ Save")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                opportunity.interested
                                ? Color.darkerGreen
                                : Color.beige2
                            )
                            .foregroundColor(
                                opportunity.interested
                                ? Color.white
                                : Color.darkerGreen
                            )
                            .clipShape(Capsule())
                    }
                    
                } else {
                    //and if they're on the interested page then the button helps them log hours
                    Button {
                        showLogPrompt = true
                    } label: {
                        
                        Text("Log Hours")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.beige2)
                            .foregroundColor(Color.darkerGreen)
                            .clipShape(Capsule())
                    }
                }
                
            }
            
            
            
            
            // Information
            HStack(alignment: .top, spacing: 15) {
                
                InfoSection(
                    icon: "mappin.circle.fill",
                    lines: [
                        String(
                            format: "%.1f miles away",
                            haversine(
                                lat1: userProfile.lat,
                                long1: userProfile.long,
                                lat2: opportunity.lat,
                                long2: opportunity.long
                            )
                        ),
                        opportunity.address
                    ]
                )
                
                
                InfoSection(
                    icon: "clock.fill",
                    lines: [
                        opportunity.date,
                        opportunity.commitment == 1
                        ? (opportunity.isWeekly ? "1 hr/week" : "1 hr")
                        : (opportunity.isWeekly
                           ? "\(opportunity.commitment) hrs/week"
                           : "\(opportunity.commitment) hrs")
                    ]
                )
                
            }
            
            
            
            Text(opportunity.description)
                .font(.system(size: 15))
                .foregroundStyle(Color.darkerGreen)
                .lineSpacing(4)
            
            
            
            HStack(spacing: 12) {
                
                Link(destination: URL(string: opportunity.website)!) {
                    
                    HStack {
                        Image(systemName: "globe")
                        Text("Website")
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.darkerGreen)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                
                
                
                Link(destination: URL(string: opportunity.contact)!) {
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                        Text("Contact")
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.darkerGreen)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
        }
        .padding(22)
        .background {
            
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
                .shadow(
                    color: .black.opacity(0.12),
                    radius: 12,
                    x: 0,
                    y: 6
                )
            
        }
        .padding(.horizontal, 20)
        .alert("Log Hours", isPresented: $showLogPrompt) {
            
            TextField("Number of hours", text: $hours)
            
            Button("Save") {
                
                if let hours = Double(hours) {
                    userProfile.hourLog.append(
                        loggedHour(
                            organization: opportunity.organization,
                            hours: hours,
                            date: Date.now,
                            logo: opportunity.logo
                        )
                    )
                }
                
                hours = ""
            }
            
            Button("Cancel", role: .cancel) {
                hours = ""
            }
            
        } message: {
            
            Text("How many hours do you want to log for \(opportunity.organization)?")
            
        }
        
    }
    
    
    
    struct InfoSection: View {
        
        let icon: String
        let lines: [String]
        
        
        var body: some View {
            
            HStack(alignment: .top, spacing: 10) {
                
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(Color.darkerGreen)
                    .frame(width: 30)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    ForEach(lines, id: \.self) { line in
                        
                        Text(line)
                            .font(.system(size: 14))
                        
                    }
                    
                }
                .foregroundStyle(Color.darkerGreen)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        
    }
    
}


#Preview {
    OpportunityCard(
        opportunity: Opportunities[7],
        userProfile: UserProfile(
            name: "Alina",
            lat: 41.88,
            long: -87.62,
            interests: [.humanService, .healthcare],
            mileRadius: 15,
            age: 16,
            interestedOpportunities: [],
            hourLog: []
        )
    )
}
