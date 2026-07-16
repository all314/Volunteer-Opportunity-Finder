//
//  Home.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import SwiftUI

struct InterestsView: View {
    
    //these properties are so that the user demographics view can pass those values in and they don't just get lost
    let name: String
    let lat: Double
    let long: Double
    let mileRadius: Double
    let age: Int
    
    var body: some View {
        VStack{
            
        }
        Color.offWhite
            .ignoresSafeArea()
    }
}

#Preview {
    InterestsView(name: "Alina", lat: 427.83, long: 131.24, mileRadius: 20, age: 18)
}
