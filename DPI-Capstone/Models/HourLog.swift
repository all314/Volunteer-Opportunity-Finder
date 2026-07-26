//
//  HourLog.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/24/26.
//

import Foundation

//struct for each time the user logs an hour

struct loggedHour: Identifiable{
    
    let id = UUID()
    
    let organization: String
    let hours: Double
    let date: Date
    let logo: String
    
}
