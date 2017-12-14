//
//  FriendCell.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

protocol FriendCellDelegate {
    func buttonPressed(cell: UITableViewCell)
}

class FriendCell: UITableViewCell {

    var delegate: FriendCellDelegate?
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendInviteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func friendInviteButtonAction(_ sender: UIButton) {
        self.delegate?.buttonPressed(cell: self)
    }
}
