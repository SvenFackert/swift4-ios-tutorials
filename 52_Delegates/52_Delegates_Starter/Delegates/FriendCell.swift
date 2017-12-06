//
//  FriendCell.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

protocol FriendCellDelegate{
     
}

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendInviteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func friendInviteButtonAction(_ sender: UIButton) {
        
    }
}
