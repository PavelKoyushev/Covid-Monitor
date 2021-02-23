//
//  ViewController.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var networkCovidManager = NetworkCovidManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkCovidManager.delegate = self
        networkCovidManager.fetchCurrentCases()
    }

}

extension ViewController: NetworkCovidManagerDelegate {
    func updateInterface(_: NetworkCovidManager, with currentCases: CurrentCases) {
        print(currentCases.country)
        print(currentCases.countryInfected)
        print(currentCases.countryRecovered)
        print(currentCases.countryDeceased)
    }
}
