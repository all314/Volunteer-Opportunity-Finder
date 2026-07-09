//
//  DistanceCalculator.swift
//  DPI-Capstone
//
//  Created by DPI Student 009 on 7/9/26.
//

import Foundation

func haversine(lat1: Double, long1: Double, lat2: Double, long2: Double) -> Double {
    let earthRadius = 3958.8 
    
    let latitudeDifference = (lat2 - lat1) * .pi / 180
    let longitudeDifference = (long2 - long1) * .pi / 180
    
    let latitude1 = lat1 * .pi / 180
    let latitude2 = lat2 * .pi / 180
    
    let a = pow(sin(latitudeDifference / 2), 2)
          + cos(latitude1) * cos(latitude2)
          * pow(sin(longitudeDifference / 2), 2)
    
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    
    return earthRadius * c
}
