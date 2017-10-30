//
//  ViewController.swift
//  FirstApp
//
//  Created by Daniel Lauer on 31/10/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButtonAction(_ sender: UIButton) {
        if sender.title(for: .normal) == "Button" {
            sender.setTitle("Hello!", for: .normal)
        }
        else {
            sender.setTitle("Button", for: .normal)
        }
    }
}

