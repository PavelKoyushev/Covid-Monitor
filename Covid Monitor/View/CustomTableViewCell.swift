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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let recoveredLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let deceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataInfectedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataRecoveredLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let dataDeceasedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(infectedLabel)
        self.contentView.addSubview(recoveredLabel)
        self.contentView.addSubview(deceasedLabel)
        self.contentView.addSubview(dataInfectedLabel)
        self.contentView.addSubview(dataRecoveredLabel)
        self.contentView.addSubview(dataDeceasedLabel)
        
        infectedLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        
        dataInfectedLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        dataInfectedLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:10).isActive = true
        
        recoveredLabel.topAnchor.constraint(equalTo:self.infectedLabel.bottomAnchor).isActive = true
        recoveredLabel.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant:10).isActive = true
        
        dataRecoveredLabel.topAnchor.constraint(equalTo:self.dataInfectedLabel.bottomAnchor).isActive = true
        dataRecoveredLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:10).isActive = true
        
        deceasedLabel.topAnchor.constraint(equalTo:self.recoveredLabel.bottomAnchor).isActive = true
        deceasedLabel.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant:10).isActive = true
        
        dataDeceasedLabel.topAnchor.constraint(equalTo:self.dataRecoveredLabel.bottomAnchor).isActive = true
        dataDeceasedLabel.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
