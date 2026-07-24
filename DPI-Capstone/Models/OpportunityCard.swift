//
//  OpportunityCard.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/15/26.
//

import SwiftUI
import Combine

struct OpportunityCard: View {
    
    @State var opportunity: Opportunity //passes in the opportunity for this card
    @ObservedObject var userProfile: UserProfile
    var showLog: Bool = false //controls whether the button on the card allows user to log time or to mark interested based on which view they're on
    
    @State private var showingHoursAlert = false //controls if the user chooses to log hours, then this is true
    @State private var hours = "" //the hours the user wants to log
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            
            HStack{
                Image(opportunity.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130, alignment: .leading)
                Spacer()
                
                if !showLog{
                    Button {
                        opportunity.interested.toggle()
                            if opportunity.interested {
                                userProfile.interestedOpportunities.append(opportunity)
                            } else {
                                userProfile.interestedOpportunities.removeAll { $0.id == opportunity.id }
                            } //removes the opportunity from interested, using its ID
                    } label: {
                        Text(opportunity.interested ? " Interested" : "Not Interested")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(maxWidth: 120, maxHeight: 30)
                            .background(opportunity.interested ? Color.lightGreen : Color.beige2)
                            .foregroundColor(opportunity.interested ? Color.offWhite : .darkerGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                } else{
                    Button{
                        showingHoursAlert = true //if they press log hours then it shows the alert
                    } label: {
                        Text("Log Hours")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .frame(maxWidth: 120, maxHeight: 30)
                            .background(Color.beige2)
                            .foregroundColor(.darkerGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }}
                
            }
            
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
        .alert("Log Hours", isPresented: $showingHoursAlert) {
                    TextField("Number of hours", text: $hours)
                    Button("Save") {
                        if let hours = Double(hours) {
                            userProfile.hourLog.append(loggedHour(organization: opportunity.organization, hours: hours, date: Date.now)) //if hours is a valid number then it adds it to the user's log. also gets what time the entry was made at. 
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
    

#Preview {
    OpportunityCard(opportunity: Opportunities[7], userProfile: UserProfile(name: "Alina", lat: 41.88, long: -87.62, interests: [.humanService, .healthcare], mileRadius: 15, age: 16, interestedOpportunities: [], hourLog: []))
}
