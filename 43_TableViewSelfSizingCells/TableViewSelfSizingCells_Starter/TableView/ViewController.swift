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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: UITableViewCell? = sender as? UITableViewCell
            
            if cell != nil && detailVC != nil {
                detailVC!.contentText = cell!.textLabel!.text
            }
        }
        else if segue.identifier == "toDetailView2" {
            let detailVC: DetailViewController2? = segue.destination as? DetailViewController2
            let cell: UITableViewCell? = sender as? UITableViewCell
            
            if cell != nil && detailVC != nil {
                detailVC!.contentText = cell!.textLabel!.text
            }
        }
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

