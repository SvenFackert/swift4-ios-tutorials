//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var contentText: String?
    var contentLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        if self.contentText != nil {
            self.contentLabel?.text = self.contentText
        }
    }

    
    func initializeInterfaceElements() {
        self.contentLabel = UILabel()
        self.contentLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.contentLabel!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.contentLabel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.contentLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
