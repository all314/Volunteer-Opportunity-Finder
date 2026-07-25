//
//  LogCard.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/24/26.
//

import SwiftUI

struct LogCard: View {
    let entry: loggedHour
    
    var body: some View {
        
        
        VStack{
            HStack(spacing: 16) {
                Text(entry.date, format: .dateTime.month().day())
                    .padding(.trailing, 5)
                    .fontWeight(.medium)
                HStack(spacing: 16){
                    Image(entry.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 70)
                        
                    
                    VStack(spacing: 6){
                        Text(entry.organization)
                        
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.bottom, 1)
                            .foregroundStyle(.darkerGreen)
                        Text("\(entry.hours, specifier: "%.1f") hours")
                            .font(.system(size: 25))
                            .foregroundStyle(.darkerGreen)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .padding(26)
                .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
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
            }
        }
        
        
        .padding(.horizontal, 20)
    }
}

#Preview {
    LogCard(entry: loggedHour(organization: "The Clare", hours: 2, date: Date(), logo: "Clare"))
}
