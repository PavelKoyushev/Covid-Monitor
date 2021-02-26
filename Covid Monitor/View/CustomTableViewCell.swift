//
//  CustomTableViewCell.swift
//  Covid Monitor
//
//  Created by Pavel Koyushev on 23.02.2021.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let nameRegionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let infectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let recoveredLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let deceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataRecoveredLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(nameRegionLabel)
        self.contentView.addSubview(infectedLabel)
        self.contentView.addSubview(recoveredLabel)
        self.contentView.addSubview(deceasedLabel)
        self.contentView.addSubview(dataInfectedLabel)
        self.contentView.addSubview(dataRecoveredLabel)
        self.contentView.addSubview(dataDeceasedLabel)
        
        NSLayoutConstraint.activate([
            
            nameRegionLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:10),
            nameRegionLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),//.isActive = true
        
            infectedLabel.topAnchor.constraint(equalTo:self.nameRegionLabel.bottomAnchor, constant:5),
            infectedLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            
            dataInfectedLabel.topAnchor.constraint(equalTo:self.nameRegionLabel.bottomAnchor,constant: 5),
            dataInfectedLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor,constant:-5),
            
            recoveredLabel.topAnchor.constraint(equalTo:self.infectedLabel.bottomAnchor, constant: 2),
            recoveredLabel.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant:10),
            
            dataRecoveredLabel.topAnchor.constraint(equalTo:self.dataInfectedLabel.bottomAnchor,constant: 2),
            dataRecoveredLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:-5),
        
            deceasedLabel.topAnchor.constraint(equalTo:self.recoveredLabel.bottomAnchor,constant: 2),
            deceasedLabel.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant:10),
        
            dataDeceasedLabel.topAnchor.constraint(equalTo:self.dataRecoveredLabel.bottomAnchor,constant: 2),
            dataDeceasedLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:-5)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
