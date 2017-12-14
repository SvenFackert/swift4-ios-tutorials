//
//  InvitationViewController.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

protocol InvitationViewControllerDelegate {
    func getInvitedFriendsCount() -> Int
    func getInvitedFriendForRowAtIndexPath(indexPath: IndexPath) -> Friend
    func uninviteFriendAtIndexPath(indexPath: IndexPath)
}


class InvitationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var delegate: InvitationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}


extension InvitationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.delegate != nil {
            return self.delegate!.getInvitedFriendsCount()
        }
        else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FriendCell? = tableView.dequeueReusableCell(withIdentifier: "friendCell") as? FriendCell
        
        if cell == nil {
            cell = FriendCell(style: .default, reuseIdentifier: "friendCell")
        }
        
        if self.delegate != nil {
            let friend: Friend = self.delegate!.getInvitedFriendForRowAtIndexPath(indexPath: indexPath)
            cell!.friendNameLabel.text = friend.name
            cell!.friendImageView.image = UIImage(named: friend.imageName)
            cell!.friendInviteButton.setTitle("uninvite", for: .normal)
            cell!.delegate = self
        }
        
        cell!.selectionStyle = .none
        
        return cell!
    }
}


extension InvitationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
}


extension InvitationViewController: FriendCellDelegate {
    func buttonPressed(cell: UITableViewCell) {
        let indexPath: IndexPath? = self.tableView.indexPath(for: cell)
        if indexPath != nil {
            self.delegate?.uninviteFriendAtIndexPath(indexPath: indexPath!)
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        }
    }
}
