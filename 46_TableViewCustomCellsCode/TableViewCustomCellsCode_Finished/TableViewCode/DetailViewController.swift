//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var name: String?
    var imageName: String?
    var personImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        if self.name != nil {
            self.title = self.name!
        }
        
        if self.imageName != nil {
            self.personImageView?.image = UIImage(named: self.imageName!)
        }
    }

    
    func initializeInterfaceElements() {
        self.personImageView = UIImageView()
        self.personImageView!.translatesAutoresizingMaskIntoConstraints = false
        self.personImageView!.contentMode = .scaleAspectFit
        self.view.addSubview(self.personImageView!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.personImageView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.personImageView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.personImageView!.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        self.personImageView!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
