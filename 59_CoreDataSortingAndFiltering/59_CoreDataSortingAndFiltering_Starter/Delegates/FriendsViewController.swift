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
    var friends: [FriendEntity] = []
    var invitedFriends: [FriendEntity] = []
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var childManagedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.childManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.childManagedObjectContext?.parent = self.appDelegate.coreDataStack.managedObjectContext
        
        let firstStart: Bool? = UserDefaults.standard.object(forKey: "firstStart") as? Bool
        
        if firstStart == nil {
            self.createDemoData()
            UserDefaults.standard.set(false, forKey: "firstStart")
        }
        
        self.fetchFriends()
        self.fetchInvitedFriends()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func createDemoData() {
        let friendEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "FriendEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        let invitationEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "InvitationEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if friendEntity != nil {
            let friend1: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend1.name = "Rambo"
            friend1.imageName = "rambo"
            friend1.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            
            let friend2: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend2.name = "Terminator"
            friend2.imageName = "terminator"
            friend2.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            
            let friend3: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend3.name = "John McClane"
            friend3.imageName = "johnmcclane"
            friend3.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            
            let friend4: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend4.name = "Joker"
            friend4.imageName = "joker"
            friend4.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            
            let friend5: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            friend5.name = "Chuck Norris"
            friend5.imageName = "chucknorris"
            friend5.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    
    func fetchFriends() {
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendEntity")
        fetchRequest.predicate = NSPredicate(format: "isInvited.invited == false")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedFriends: [FriendEntity]? = results as? [FriendEntity]
                if fetchedFriends != nil {
                    self.friends = fetchedFriends!
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        }
    }
    
    
    func fetchInvitedFriends() {
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendEntity")
        fetchRequest.predicate = NSPredicate(format: "isInvited.invited == true")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedFriends: [FriendEntity]? = results as? [FriendEntity]
                if fetchedFriends != nil {
                    self.invitedFriends = fetchedFriends!
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
    
    
    @IBAction func addBarButtonAction(_ sender: UIBarButtonItem) {
        let friendEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "FriendEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        let invitationEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "InvitationEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if friendEntity != nil {
            let newFriend: FriendEntity = FriendEntity(entity: friendEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            newFriend.name = "Mr Bean"
            newFriend.imageName = "mrbean"
            newFriend.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            self.friends.append(newFriend)
            self.tableView.insertRows(at: [IndexPath(row: self.friends.count-1, section: 0)], with: .automatic)
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    
    
    @IBAction func editBarButtonAction(_ sender: UIBarButtonItem) {
        if self.friends.count > 0 {
            let friend: FriendEntity = self.friends[self.friends.count-1]
            let friendFromChildContext: FriendEntity? = self.childManagedObjectContext?.object(with: friend.objectID) as? FriendEntity
            friendFromChildContext!.name = friendFromChildContext!.name.uppercased()
            self.friends[self.friends.count-1] = friendFromChildContext!
            self.tableView.reloadRows(at: [IndexPath(row: self.friends.count-1, section: 0)], with: .automatic)
            
            //self.appDelegate.coreDataStack.saveContext()
        }
    }
    
    
    @IBAction func saveEditBarButtonAction(_ sender: UIBarButtonItem) {
        if self.childManagedObjectContext!.hasChanges {
            self.childManagedObjectContext!.perform {
                do {
                    try self.childManagedObjectContext!.save()
                }
                catch let error as NSError {
                    fatalError("Error: \(error.localizedDescription)")
                }
                
                self.appDelegate.coreDataStack.saveContext()
                self.fetchFriends()
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func deleteBarButtonAction(_ sender: UIBarButtonItem) {
        if self.friends.count > 0 {
            let friend: FriendEntity = self.friends[self.friends.count-1]
            let lastObjectIndex: Int = self.friends.count - 1
            self.friends.remove(at: lastObjectIndex)
            self.tableView.deleteRows(at: [IndexPath(row: lastObjectIndex, section: 0)], with: .automatic)
            if friend.managedObjectContext == self.childManagedObjectContext {
                self.childManagedObjectContext?.delete(friend)
            }
            else {
                self.appDelegate.coreDataStack.managedObjectContext.delete(friend)
                self.appDelegate.coreDataStack.saveContext()
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
        
        let friend: FriendEntity = friends[indexPath.row]
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
            let friend: FriendEntity = friends[indexPath!.row]
            friend.isInvited.invited = true
            self.appDelegate.coreDataStack.saveContext()
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
    
    func getInvitedFriendForRowAtIndexPath(indexPath: IndexPath) -> FriendEntity {
        return self.invitedFriends[indexPath.row]
    }
    
    func uninviteFriendAtIndexPath(indexPath: IndexPath) {
        let friend: FriendEntity = self.invitedFriends[indexPath.row]
        friend.isInvited.invited = false
        self.appDelegate.coreDataStack.saveContext()
        self.invitedFriends.remove(at: indexPath.row)
        self.friends.append(friend)
        self.tableView.insertRows(at: [IndexPath(row: self.friends.count-1, section: 0)], with: .automatic)
    }
}
