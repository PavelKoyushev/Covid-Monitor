//
//  extViewController+SetupView.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 26.02.2021.
//

import UIKit
import Foundation

extension ViewController {
    
    func subviews() {
        view.addSubview(countryLabel)
        
        view.addSubview(totalInfectedLabel)
        view.addSubview(totalDeceasedLabel)
        view.addSubview(totalDataInfectedLabel)
        view.addSubview(totalDataDeceasedLabel)
        
        view.addSubview(containerView)
        view.addSubview(tableView)
    }
    
    func setupTopView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 78),
            
            countryLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant:7),
            countryLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            
            totalInfectedLabel.topAnchor.constraint(equalTo:self.countryLabel.topAnchor, constant:22),
            totalInfectedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            totalDataInfectedLabel.topAnchor.constraint(equalTo:self.countryLabel.topAnchor,constant: 22),
            totalDataInfectedLabel.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant:-5),
            
            totalDeceasedLabel.topAnchor.constraint(equalTo: self.totalInfectedLabel.bottomAnchor, constant: 5),
            totalDeceasedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            totalDataDeceasedLabel.topAnchor.constraint(equalTo: self.totalDataInfectedLabel.bottomAnchor, constant: 5),
            totalDataDeceasedLabel.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant:-5),
        ])
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
