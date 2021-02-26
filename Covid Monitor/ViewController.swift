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
    
    var totalDataDeceased = String()
    var totalDataInfected = String()
    
    //MARK Top view
    let totalInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDataInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let totalDataDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
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
            self.totalDataInfected = String(currentCases.countryInfected)
            self.totalDataDeceased = String(currentCases.countryDeceased)
            
            self.totalInfectedLabel.text = "Всего инфицировано"
            self.totalDataInfectedLabel.text = self.totalDataInfected
            
            self.totalDeceasedLabel.text = "Всего умерло"
            self.totalDataDeceasedLabel.text = self.totalDataDeceased
            
            self.tableView.reloadData()
        }
    }
}

extension ViewController {
    func subviews() {
        view.addSubview(totalInfectedLabel)
        view.addSubview(totalDeceasedLabel)
        view.addSubview(totalDataInfectedLabel)
        view.addSubview(totalDataDeceasedLabel)
        
        view.addSubview(containerView)
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            
            totalInfectedLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant:5),
            totalInfectedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            totalDataInfectedLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 5),
            totalDataInfectedLabel.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant:-5),
            
            totalDeceasedLabel.topAnchor.constraint(equalTo: self.totalInfectedLabel.bottomAnchor, constant: 5),
            totalDeceasedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            totalDataDeceasedLabel.topAnchor.constraint(equalTo: self.totalDataInfectedLabel.bottomAnchor, constant: 5),
            totalDataDeceasedLabel.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant:-5),
            
            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
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
        cell.infectedLabel.text = "Инфицировано"
        cell.dataInfectedLabel.text = String(regions[indexPath.row].infected)
        cell.recoveredLabel.text = "Вылечено"
        cell.dataRecoveredLabel.text = String(regions[indexPath.row].recovered)
        cell.deceasedLabel.text = "Умерло"
        cell.dataDeceasedLabel.text = String(regions[indexPath.row].deceased)
        
        return cell
    }
}
