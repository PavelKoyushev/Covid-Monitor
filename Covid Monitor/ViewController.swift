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
    
    //MARK Top view
    let countryLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDataInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDataDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    //container
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
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
        setupTopView()
        
        networkCovidManager.delegate = self
        networkCovidManager.fetchCurrentCases()
        
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 98
    }
}

extension ViewController: NetworkCovidManagerDelegate {
    func updateInterface(_: NetworkCovidManager, with currentCases: CurrentCases) {
        DispatchQueue.main.async {
            self.regions = currentCases.region.sorted(by: {$0.infected > $1.infected})
            
            self.countryLabel.text = currentCases.country
            self.totalInfectedLabel.text = "Всего инфицировано"
            self.totalDataInfectedLabel.text = String(currentCases.countryInfected)
            self.totalDeceasedLabel.text = "Всего умерло"
            self.totalDataDeceasedLabel.text = String(currentCases.countryDeceased)
            
            self.tableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let cases = regions[indexPath.row]
        
        cell.nameRegionLabel.text = cases.region
        cell.infectedLabel.text = "Инфицировано"
        cell.recoveredLabel.text = "Вылечено"
        cell.deceasedLabel.text = "Умерло"
        cell.dataInfectedLabel.text = String(cases.infected)
        cell.dataRecoveredLabel.text = String(cases.recovered)
        cell.dataDeceasedLabel.text = String(cases.deceased)
        
        return cell
    }
}
