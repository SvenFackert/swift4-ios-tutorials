//
//  DetailViewController2.swift
//  TableViewCode
//
//  Created by Daniel Lauer on 27/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {

    var contentText: String?
    var contentLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        if self.contentText != nil {
            self.contentLabel?.text = self.contentText
        }
    }
    
    
    func initializeInterfaceElements() {
        self.contentLabel = UILabel()
        self.contentLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel!.numberOfLines = 0
        self.view.addSubview(self.contentLabel!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.contentLabel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.contentLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.contentLabel!.topAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        self.contentLabel!.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        self.contentLabel!.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -10.0).isActive = true
        self.contentLabel!.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10.0).isActive = true
    }


}
