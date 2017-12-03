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
    var people: [Person] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDemoData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    
    func createDemoData() {
        let person1: Person = Person(name: "Rambo", personImageName: "rambo", flagImageName: "usa")
        let person2: Person = Person(name: "Terminator", personImageName: "terminator", flagImageName: "austria")
        let person3: Person = Person(name: "John McClane", personImageName: "johnmcclane", flagImageName: "germany")
        let person4: Person = Person(name: "Joker", personImageName: "joker", flagImageName: "australia")
        people.append(person1)
        people.append(person2)
        people.append(person3)
        people.append(person4)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: UITableViewCell? = sender as? UITableViewCell
            
            if cell != nil && detailVC != nil {
                let indexPath: IndexPath? = self.tableView.indexPath(for: cell!)
                if indexPath != nil {
                    let person: Person = people[indexPath!.row]
                    detailVC!.name = person.name
                    detailVC!.imageName = person.personImageName
                }
            }
        }
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: PersonCell? = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonCell
        
        if cell == nil {
            cell = PersonCell(style: .default, reuseIdentifier: "personCell")
        }
        
        let currentPerson: Person = people[indexPath.row]
        cell!.contentLabel.text = currentPerson.name
        cell!.personImageView.image = UIImage(named: currentPerson.personImageName)
        cell!.flagImageView.image = UIImage(named: currentPerson.flagImageName)
        cell!.accessoryType = .disclosureIndicator
        
        return cell!
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

