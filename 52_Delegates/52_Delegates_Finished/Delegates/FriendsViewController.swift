//
//  FriendsViewController.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var friends: [Friend] = []
    var invitedFriends: [Friend] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDemoData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func createDemoData() {
        let friend1: Friend = Friend(name: "Rambo", imageName: "rambo")
        let friend2: Friend = Friend(name: "Terminator", imageName: "terminator")
        let friend3: Friend = Friend(name: "John McClane", imageName: "johnmcclane")
        let friend4: Friend = Friend(name: "Joker", imageName: "joker")
        let friend5: Friend = Friend(name: "Chuck Norris", imageName: "chucknorris")
        friends = [friend1, friend2, friend3, friend4, friend5]
    }

    
    @IBAction func backToFriendsViewController(segue: UIStoryboardSegue) {
        // Storyboard back to FriendsViewController segue
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInvitationViewController" {
            let navigationController: UINavigationController? = segue.destination as? UINavigationController
            if navigationController != nil {
                let invitationVC: InvitationViewController? = navigationController!.viewControllers[0] as? InvitationViewController
                if invitationVC != nil {
                    invitationVC!.delegate = self
                }
            }
        }
    }
}


extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FriendCell? = tableView.dequeueReusableCell(withIdentifier: "friendCell") as? FriendCell
        
        if cell == nil {
            cell = FriendCell(style: .default, reuseIdentifier: "friendCell")
        }
        
        let friend: Friend = friends[indexPath.row]
        cell!.friendNameLabel.text = friend.name
        cell!.friendImageView.image = UIImage(named: friend.imageName)
        cell!.delegate = self
        cell!.selectionStyle = .none
        
        return cell!
    }
}


extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
}


extension FriendsViewController: FriendCellDelegate {
    func buttonPressed(cell: UITableViewCell) {
        let indexPath: IndexPath? = self.tableView.indexPath(for: cell)
        if indexPath != nil {
            let friend: Friend = friends[indexPath!.row]
            self.friends.remove(at: indexPath!.row)
            self.invitedFriends.append(friend)
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        }
    }
}


extension FriendsViewController: InvitationViewControllerDelegate {
    func getInvitedFriendsCount() -> Int {
        return self.invitedFriends.count
    }
    
    
    func getInvitedFriendForRowAtIndexPath(indexPath: IndexPath) -> Friend {
        return self.invitedFriends[indexPath.row]
    }
    
    
    func uninviteFriendAtIndexPath(indexPath: IndexPath) {
        let friend: Friend = self.invitedFriends[indexPath.row]
        self.invitedFriends.remove(at: indexPath.row)
        self.friends.append(friend)
        self.tableView.insertRows(at: [IndexPath(row: self.friends.count-1, section: 0)], with: .automatic)
    }
}
