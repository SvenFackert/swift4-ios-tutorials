//
//  DetailViewController.swift
//  TableView
//
//  Created by Daniel Lauer on 26/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var contentText: String?
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentText != nil {
            self.contentLabel.text = contentText!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
