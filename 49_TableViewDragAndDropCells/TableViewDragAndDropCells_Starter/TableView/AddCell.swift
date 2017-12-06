//
//  AddCell.swift
//  TableView
//
//  Created by Daniel Lauer on 30/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class AddCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentLabel.text = "Insert a new cell"
    }

}
