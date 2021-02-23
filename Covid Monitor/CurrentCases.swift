//
//  CurrentCases.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import Foundation

struct CurrentCases {

    let countryInfected: Int
    let countryTested: Int
    let countryRecovered: Int
    let countryDeceased: Int
    
    var region = [(region: String, infected: Int, recovered: Int, deceased: Int)]()
    
    let country: String
    let lastUpdatedAtApify: String
    
    init?(currentCasesData: CurrentCasesData) {
        countryInfected = currentCasesData.infected
        countryTested = currentCasesData.tested
        countryRecovered = currentCasesData.recovered
        countryDeceased = currentCasesData.deceased
        
        for item in currentCasesData.infectedByRegion {
            region.append((region: item.region, infected: item.infected, recovered: item.recovered, deceased: item.deceased))
        }
        
        country = currentCasesData.country
        lastUpdatedAtApify = currentCasesData.lastUpdatedAtApify
    }
}
