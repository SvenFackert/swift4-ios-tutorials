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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
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
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 || indexPath.row % 2 == 0 {
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell2")
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell2")
                cell!.textLabel?.numberOfLines = 0
            }
            
            cell!.textLabel?.text = "Zeile \(indexPath.row + 1) Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile Zeile"
            
            return cell!
        }
        else {
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
            }
            
            cell!.textLabel?.text = "Zeile \(indexPath.row + 1)"
            
            return cell!
        }
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell != nil {
            if cell!.reuseIdentifier != nil {
                if cell!.reuseIdentifier! == "defaultCell" {
                    let detailVC: DetailViewController = DetailViewController()
                    detailVC.contentText = cell?.textLabel?.text
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
                else if cell!.reuseIdentifier! == "defaultCell2" {
                    let detailVC: DetailViewController2 = DetailViewController2()
                    detailVC.contentText = cell?.textLabel?.text
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





