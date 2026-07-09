//
//  UserProfile.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/7/26.
//

import Foundation

enum Interests: String{
    case animalWelfare = "Animal Welfare"
    case humanService = "Human Services"
    case environment = "Environment"
    case healthcare = "Healthcare"
    case tutoring = "Tutoring"
    case artMusic = "Arts & Music"
}

struct UserProfile {
    var name: String
    var lat: Double
    var long: Double
    var interests: [Interests]
    var mileRadius: Double
    var age: Int
}

struct Opportunity {
    var lat: Double
    var long: Double
    var interestTag: Interests
    var organization: String
    var description: String
    var date: DateComponents
    var commitment: Int
    var minimumAge: Int
    
}
