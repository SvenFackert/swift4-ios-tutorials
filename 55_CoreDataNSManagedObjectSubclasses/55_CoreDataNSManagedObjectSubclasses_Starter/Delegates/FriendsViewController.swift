//
//  FriendsViewController.swift
//  Delegates
//
//  Created by Daniel Lauer on 03/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit
import CoreData

class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var friends: [Friend] = []
    var invitedFriends: [Friend] = []
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstStart: Bool? = UserDefaults.standard.object(forKey: "firstStart") as? Bool
        
        if firstStart == nil {
            self.createDemoData()
            UserDefaults.standard.set(false, forKey: "firstStart")
        }
        
        self.fetchDemoData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func createDemoData() {
        let friendEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "FriendEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if friendEntity != nil {
            let friend1 = NSManagedObject(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend1.setValue("Rambo", forKey: "name")
            friend1.setValue("rambo", forKey: "imageName")
            
            let friend2 = NSManagedObject(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend2.setValue("Terminator", forKey: "name")
            friend2.setValue("terminator", forKey: "imageName")
            
            let friend3 = NSManagedObject(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend3.setValue("John McClane", forKey: "name")
            friend3.setValue("johnmcclane", forKey: "imageName")
            
            let friend4 = NSManagedObject(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend4.setValue("Joker", forKey: "name")
            friend4.setValue("joker", forKey: "imageName")
            
            let friend5 = NSManagedObject(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend5.setValue("Chuck Norris", forKey: "name")
            friend5.setValue("chucknorris", forKey: "imageName")
            
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    
    
    func fetchDemoData() {
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendEntity")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                for friend in results {
                    let name: String? = friend.value(forKey: "name") as? String
                    let imageName: String? = friend.value(forKey: "imageName") as? String
                    
                    if name != nil && imageName != nil {
                        let newFriend: Friend = Friend(name: name!, imageName: imageName!)
                        self.friends.append(newFriend)
                    }
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        }
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
            self.invitedFriends.append(friend)
            self.friends.remove(at: indexPath!.row)
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
