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
        
        self.myButton.setTitleColor(UIColor.yellow, for: .normal)
        self.view.backgroundColor = UIColor.brown
        
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
    }

    @IBAction func myButtonAction(_ sender: UIButton) {
        if sender.title(for: .normal) == "Button" {
            sender.setTitle("Hello!", for: .normal)
        }
        else {
            sender.setTitle("Button", for: .normal)
        }
    }

    @IBAction func backToPreviousViewController(segue: UIStoryboardSegue) {
        
    }
    
}

