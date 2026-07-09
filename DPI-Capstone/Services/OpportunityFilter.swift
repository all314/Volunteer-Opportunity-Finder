//
//  OpportunityFilter.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/9/26.
//

import Foundation
let userProfile = UserProfile(name: "Alina", lat: 42.88, long: 67.55, interests: [.artMusic, .healthcare], mileRadius: 10, age: 16)

let filteredOpportunities = Opportunities.filter { opportunity in
    userProfile.interests.contains(opportunity.interestTag)
    userProfile.age >= opportunity.minimumAge
    return haversine(lat1: userProfile.lat, long1: userProfile.long, lat2: opportunity.lat, long2: opportunity.long) <= userProfile.mileRadius
    
    
}
