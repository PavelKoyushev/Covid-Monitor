//
//  NetworkCovidManager.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import Foundation

protocol NetworkCovidManagerDelegate: class {
    func updateInterface(_: NetworkCovidManager, with currentCases: CurrentCases)
}

class NetworkCovidManager {
    
    weak var delegate: NetworkCovidManagerDelegate?
    
    func fetchCurrentCases() {
        let urlString = "https://api.apify.com/v2/key-value-stores/1brJ0NLbQaJKPTWMO/records/LATEST?disableRedirect=true"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.delegate?.updateInterface(self, with: currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentCases? {
        let decoder = JSONDecoder()
        do {
            let currentCasesData = try decoder.decode(CurrentCasesData.self, from: data)
            guard let currentWeather = CurrentCases(currentCasesData: currentCasesData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
