//
//  DetailViewController.swift
//  TableView
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var name: String?
    var imageName: String?
    
    @IBOutlet weak var personImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.name != nil {
            self.title = name!
        }
        
        if self.imageName != nil {
            self.personImageView.image = UIImage(named: imageName!)
        }
    }
}
