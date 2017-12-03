//
//  ViewController.swift
//  TableViewCode
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView = UITableView()
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createDemoData()
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
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
    
    
    func initializeInterfaceElements() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
    }
    
    
    func autolayoutInterfaceElements() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: PersonCell? = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonCell
        
        if cell == nil {
            cell = PersonCell(style: .default, reuseIdentifier: "personCell")
        }
        
        let currentPerson: Person = self.people[indexPath.row]
        cell!.contentLabel.text = currentPerson.name
        cell!.personImageView.image = UIImage(named: currentPerson.personImageName)
        cell!.flagImageView.image = UIImage(named: currentPerson.flagImageName)
        cell!.accessoryType = .disclosureIndicator
        
        return cell!
        
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell != nil {
            if cell!.reuseIdentifier != nil {
                if cell!.reuseIdentifier! == "personCell" {
                    let detailVC: DetailViewController = DetailViewController()
                    let currentPerson: Person = self.people[indexPath.row]
                    detailVC.name = currentPerson.name
                    detailVC.imageName = currentPerson.personImageName
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}





