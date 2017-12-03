//
//  PersonCell.swift
//  TableViewCode
//
//  Created by Daniel Lauer on 30/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    var personImageView: UIImageView = UIImageView()
    var flagImageView: UIImageView = UIImageView()
    var contentLabel: UILabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    func initializeInterfaceElements() {
        self.personImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.personImageView)
        
        self.flagImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.flagImageView)
        
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.contentLabel)
    }
    
    
    func autolayoutInterfaceElements() {
        self.personImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        self.personImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0).isActive = true
        self.personImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
        self.personImageView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        let heightConstraint: NSLayoutConstraint = self.personImageView.heightAnchor.constraint(equalToConstant: 50.0)
        heightConstraint.priority = UILayoutPriority(999)
        heightConstraint.isActive = true
        
        self.flagImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        self.flagImageView.leadingAnchor.constraint(equalTo: self.personImageView.trailingAnchor, constant: 5.0).isActive = true
        self.flagImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
        self.flagImageView.widthAnchor.constraint(equalToConstant: 90.0).isActive = true
        let heightConstraint2: NSLayoutConstraint = self.flagImageView.heightAnchor.constraint(equalToConstant: 50.0)
        heightConstraint2.priority =  UILayoutPriority(999)
        heightConstraint2.isActive = true
        
        self.contentLabel.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        self.contentLabel.leadingAnchor.constraint(equalTo: self.flagImageView.trailingAnchor, constant: 10.0).isActive = true
        self.contentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 5.0).isActive = true
        self.contentLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
        self.contentLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    
    override func prepareForReuse() {
        self.contentLabel.text = ""
        self.personImageView.image = nil
        self.flagImageView.image = nil
    }

}
