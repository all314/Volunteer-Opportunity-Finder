//
//  ProfileView.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/20/26.
//

import SwiftUI

struct ProfileView: View {

    @State private var name: String = ""
    @State private var lat: Double? = nil
    @State private var long: Double? = nil
    @State private var mileRadius: Double? = nil
    @State private var age: Int? = nil

    var body: some View {

        ZStack {

            Color(.offWhite)
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color.lightGreen)
                        .frame(width: 95, height: 95)

                    Image(systemName: "leaf.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                }

                VStack(spacing: 8) {

                    Text("SwiftSearcher")
                        .font(.system(size: 34, weight: .bold))

                    Text("Explore volunteer opportunities near you!")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 18) {

                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    TextField("Age", value: $age, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Latitude", value: $lat, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    TextField("Longitude", value: $long, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    TextField("Mile Radius", value: $mileRadius, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                    NavigationLink {
                        
                        InterestsView(user: UserProfile(name: name, lat: lat ?? 0, long: long ?? 0, interests: [], mileRadius: mileRadius ?? 0, age: age ?? 16,
                                                        interestedOpportunities: [],
                            hourLog: []))
                        
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.darkerGreen)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                }
                .padding(25)
                .background(Color.beige).clipShape(RoundedRectangle(cornerRadius: 28))
                .shadow(color: .black.opacity(0.08), radius: 15, y: 8)
                .padding(.horizontal)

                Spacer()

            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack{
        ProfileView()
    }
   
}
