//
//  ViewController.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var networkCovidManager = NetworkCovidManager()
    var regions = [(region: String, infected: Int, recovered: Int, deceased: Int)]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        subviews()
        setupTableView()
        
        networkCovidManager.delegate = self
        networkCovidManager.fetchCurrentCases()
        
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 60
    }
}

extension ViewController: NetworkCovidManagerDelegate {
    func updateInterface(_: NetworkCovidManager, with currentCases: CurrentCases) {
        print(currentCases.country)
        print(currentCases.countryInfected)
        print(currentCases.countryRecovered)
        print(currentCases.countryDeceased)
        print(currentCases.region)
        
        DispatchQueue.main.async {
            self.regions = currentCases.region
            self.tableView.reloadData()
        }
    }
}

extension ViewController {
    func subviews() {
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameRegionLabel.text = regions[indexPath.row].region

        cell.infectedLabel.text = "Infected"
        cell.dataInfectedLabel.text = String(regions[indexPath.row].infected)
        
        cell.recoveredLabel.text = "Recovered"
        cell.dataRecoveredLabel.text = String(regions[indexPath.row].recovered)
        
        cell.deceasedLabel.text = "Deceased"
        cell.dataDeceasedLabel.text = String(regions[indexPath.row].deceased)
//        cell.labUserName.text = regions[indexPath.row].region
//        cell.labMessage.text = "Infected"
//        cell.labTime.text = String(regions[indexPath.row].infected)
        
        return cell
    }
}
