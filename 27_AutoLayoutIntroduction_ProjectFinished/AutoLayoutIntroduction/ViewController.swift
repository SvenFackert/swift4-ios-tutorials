//
//  ViewController.swift
//  AutoLayoutIntroduction
//
//  Created by Daniel Lauer on 01/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonAction(_ sender: UIButton) {
        self.firstNameTextField.text = ""
        self.lastNameTextField.text = ""
        self.emailTextField.text = ""
        self.resultLabel.text = ""
    }

    @IBAction func sendButtonAction(_ sender: UIButton) {
        self.resultLabel.text = "\(self.firstNameTextField.text!) \(self.lastNameTextField.text!), \(self.emailTextField.text!)"
    }
    
}

