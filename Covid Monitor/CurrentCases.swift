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
    
    let region: String
    let regionInfected: Int
    let regionRecovered: Int
    let regionDeceased: Int
    
    let country: String
    let lastUpdatedAtApify: String
    
    init?(currentCasesData: CurrentCasesData) {
        countryInfected = currentCasesData.infected
        countryTested = currentCasesData.tested
        countryRecovered = currentCasesData.recovered
        countryDeceased = currentCasesData.deceased
        
        region = currentCasesData.infectedByRegion.first!.region
        regionInfected = currentCasesData.infectedByRegion.first!.infected
        regionRecovered = currentCasesData.infectedByRegion.first!.recovered
        regionDeceased = currentCasesData.infectedByRegion.first!.deceased
        
        country = currentCasesData.country
        lastUpdatedAtApify = currentCasesData.lastUpdatedAtApify
    }
}
