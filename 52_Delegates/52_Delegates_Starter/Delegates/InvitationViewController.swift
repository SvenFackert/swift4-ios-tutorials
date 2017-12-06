//
//  InvitationViewController.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class InvitationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}


extension InvitationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // TO DO: Insert number of invited friends
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FriendCell? = tableView.dequeueReusableCell(withIdentifier: "friendCell") as? FriendCell
        
        if cell == nil {
            cell = FriendCell(style: .default, reuseIdentifier: "friendCell")
        }
        
        // TO DO: Insert friend name and image
        
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
