//
//  Model.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import Foundation

// MARK: - CurrentCasesData
struct CurrentCasesData: Codable {
    let infected, tested, recovered, deceased: Int
    
    let infectedByRegion: [InfectedByRegionData]
    
    let country: String
    let lastUpdatedAtApify: String
}

// MARK: - InfectedByRegion
struct InfectedByRegionData: Codable {
    let region: String
    let infected, recovered, deceased: Int
}
