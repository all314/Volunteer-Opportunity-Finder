//
//  UserProfile.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import Foundation
import Combine

enum Interests: String{
    case animalWelfare = "Animal Welfare"
    case humanService = "Human Services"
    case environment = "Environment"
    case healthcare = "Healthcare"
    case tutoring = "Tutoring"
    case artMusic = "Arts & Music"
}

class UserProfile: ObservableObject, Identifiable {
    var name: String
    var lat: Double
    var long: Double
    var interests: [Interests]
    var mileRadius: Double
    var age: Int

    @Published var interestedOpportunities: [Opportunity]
    var hourLog: [loggedHour]

    init(name: String, lat: Double, long: Double, interests: [Interests],
         mileRadius: Double, age: Int, interestedOpportunities: [Opportunity],
         hourLog: [loggedHour]) {
        self.name = name
        self.lat = lat
        self.long = long
        self.interests = interests
        self.mileRadius = mileRadius
        self.age = age
        self.interestedOpportunities = interestedOpportunities
        self.hourLog = hourLog
    }
}

struct Opportunity: Identifiable {
    let id = UUID()
    
    var lat: Double
    var long: Double
    var interestTag: Interests
    var organization: String
    var description: String
    var date: String
    var commitment: Int
    var minimumAge: Int
    var logo: String
    var address: String
    var website: String
    var contact: String
    var interested: Bool = false //if the user is interested in this one or not.
    
}


