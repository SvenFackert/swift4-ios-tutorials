//
//  DetailViewController2.swift
//  TableView
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {

    var contentText: String?
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.contentText != nil {
            self.contentLabel.text = contentText!
        }
    }
}
