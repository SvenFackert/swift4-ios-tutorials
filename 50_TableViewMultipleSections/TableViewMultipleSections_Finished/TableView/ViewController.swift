//
//  ViewController.swift
//  TableView
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var people: [[Person]] = [[], [], []]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDemoData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    func createDemoData() {
        let person1: Person = Person(name: "Rambo", personImageName: "rambo", flagImageName: "usa")
        let person2: Person = Person(name: "Terminator", personImageName: "terminator", flagImageName: "austria")
        let person3: Person = Person(name: "John McClane", personImageName: "johnmcclane", flagImageName: "germany")
        let person4: Person = Person(name: "Joker", personImageName: "joker", flagImageName: "australia")
        people[0].append(person1)
        people[1].append(person2)
        people[1].append(person3)
        people[2].append(person4)
    }
    
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        super.setEditing(editing, animated: animated)
//        if editing {
//            self.tableView.setEditing(true, animated: true)
//            self.tableView!.insertRows(at: [IndexPath(row: self.people.count, section: 0)], with: .automatic)
//        }
//        else {
//            self.tableView.setEditing(false, animated: true)
//            self.tableView!.deleteRows(at: [IndexPath(row: self.people.count, section: 0)], with: .automatic)
//        }
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: UITableViewCell? = sender as? UITableViewCell
            
            if cell != nil && detailVC != nil {
                let indexPath: IndexPath? = self.tableView.indexPath(for: cell!)
                if indexPath != nil {
                    let person: Person = people[indexPath!.section][indexPath!.row]
                    detailVC!.name = person.name
                    detailVC!.imageName = person.personImageName
                }
            }
        }
    }
}



extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.people.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "North America"
        }
        else if section == 1 {
            return "Europe"
        }
        else if section == 2 {
            return "Australia"
        }
        else {
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.isEditing {
//            return self.people.count + 1
//        }
//        else {
//            return self.people.count
//        }
        
        return self.people[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.people.count && self.isEditing == true {
            var cell: AddCell? = tableView.dequeueReusableCell(withIdentifier: "AddCell") as? AddCell
            
            if cell == nil {
                cell = AddCell(style: .default, reuseIdentifier: "AddCell")
            }
            
            return cell!
        }
        
        
        var cell: PersonCell? = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonCell
        
        if cell == nil {
            cell = PersonCell(style: .default, reuseIdentifier: "personCell")
        }
        
        let currentPerson: Person = people[indexPath.section][indexPath.row]
        cell!.contentLabel.text = currentPerson.name
        cell!.personImageView.image = UIImage(named: currentPerson.personImageName)
        cell!.flagImageView.image = UIImage(named: currentPerson.flagImageName)
        cell!.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.people.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        else if editingStyle == .insert {
//            people.append(Person(name: "Chuck Norris", personImageName: "chucknorris", flagImageName: "usa"))
//            self.tableView.insertRows(at: [IndexPath(row:self.people.count - 1, section: 0)], with: .automatic)
//        }
//    }
//    
//    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == self.people.count {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//    
//    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        if sourceIndexPath.row < self.people.count && destinationIndexPath.row < self.people.count {
//            let person: Person? = self.people[sourceIndexPath.row]
//            self.people.remove(at: sourceIndexPath.row)
//            if person != nil {
//                self.people.insert(person!, at: destinationIndexPath.row)
//            }
//        }
//    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        if indexPath.row == self.people.count {
//            return .insert
//        }
//        else {
//            return .delete
//        }
//    }
    
    
//    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//        if proposedDestinationIndexPath.row >= self.people.count {
//            return sourceIndexPath
//        }
//        else {
//            return proposedDestinationIndexPath
//        }
//    }
}

