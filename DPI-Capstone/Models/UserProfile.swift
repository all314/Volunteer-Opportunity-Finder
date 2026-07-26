//
//  UserProfile.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

//self explanatory structs/classes/enums below

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

    @Published var interestedOpportunities: [Opportunity] //every time this is changed, it notifies the views that have UserProfile passed into it
    
    var hourLog: [loggedHour]

    init(name: String, lat: Double, long: Double, interests: [Interests],
         mileRadius: Double, age: Int, interestedOpportunities: [Opportunity],
         hourLog: [loggedHour]) {
        self.name = name //self = the instance that's created, so like if you're initializing it then whatever's passed into the instance is then put as the properties for the class
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
    let id = UUID() //so each opportunity has its own ID so that for opportunities, their corresponding log or opportunity cards can be displayed
    
    var lat: Double
    var long: Double
    var interestTag: Interests
    var organization: String
    var description: String
    var date: String
    var commitment: Int //time commitment
    var minimumAge: Int
    var logo: String
    var address: String
    var website: String
    var contact: String
    var interested: Bool = false //if the user is interested in this opportunity or not
    var isWeekly: Bool
    
}


