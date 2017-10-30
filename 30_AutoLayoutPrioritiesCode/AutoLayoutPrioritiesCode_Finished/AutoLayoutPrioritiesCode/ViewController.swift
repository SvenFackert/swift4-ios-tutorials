//
//  ViewController.swift
//  AutoLayoutPrioritiesCode
//
//  Created by Daniel Lauer on 08/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label1: UILabel?
    var label2: UILabel?
    var button1: UIButton?
    var button2: UIButton?
    var button3: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }

    
    func initializeInterfaceElements() {
        self.label1 = UILabel()
        self.label1!.translatesAutoresizingMaskIntoConstraints = false
        self.label1!.text = "Label Label Label Label Label"
        self.label1!.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.label1!)
        
        self.label2 = UILabel()
        self.label2!.translatesAutoresizingMaskIntoConstraints = false
        self.label2!.text = "Test Test Test Test Test Test"
        self.label2!.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.label2!)
        
        self.button1 = UIButton(type: .system)
        self.button1!.translatesAutoresizingMaskIntoConstraints = false
        self.button1!.setTitle("Button 1", for: UIControlState.normal)
        self.button1!.backgroundColor = UIColor.lightGray
        self.button1!.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.button1!)
        
        self.button2 = UIButton(type: .system)
        self.button2!.translatesAutoresizingMaskIntoConstraints = false
        self.button2!.setTitle("Button 2", for: UIControlState.normal)
        self.button2!.backgroundColor = UIColor.lightGray
        self.button2!.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.button2!)
        
        self.button3 = UIButton(type: .system)
        self.button3!.translatesAutoresizingMaskIntoConstraints = false
        self.button3!.setTitle("Button 3", for: UIControlState.normal)
        self.button3!.backgroundColor = UIColor.lightGray
        self.button3!.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.button3!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.label1!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100.0).isActive = true
        self.label1!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        
        self.label2!.leadingAnchor.constraint(greaterThanOrEqualTo: self.label1!.trailingAnchor, constant: 20.0).isActive = true
        self.label2!.firstBaselineAnchor.constraint(equalTo: self.label1!.firstBaselineAnchor).isActive = true
        self.label2!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        self.label2!.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        
        self.button1!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        self.button1!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        
        self.button2!.leadingAnchor.constraint(equalTo: self.button1!.trailingAnchor, constant: 10.0).isActive = true
        self.button2!.trailingAnchor.constraint(equalTo: self.button3!.leadingAnchor, constant: -10.0).isActive = true
        self.button2!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        
        self.button3!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        self.button3!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        
        self.button1!.widthAnchor.constraint(equalTo: self.button3!.widthAnchor).isActive = true
        self.button2!.widthAnchor.constraint(equalTo: self.button1!.widthAnchor).isActive = true
        self.button3!.widthAnchor.constraint(equalTo: self.button2!.widthAnchor).isActive = true
        
        let button1Constraint1 = self.button1!.trailingAnchor.constraint(equalTo: self.button3!.leadingAnchor, constant: -10)
        button1Constraint1.priority = UILayoutPriority(749)
        button1Constraint1.isActive = true
        
        let button1Constraint2 = self.button1!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        button1Constraint2.priority = UILayoutPriority(749)
        button1Constraint2.isActive = true
        
        let button2Constraint1 = self.button2!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        button2Constraint1.priority = UILayoutPriority(749)
        button2Constraint1.isActive = true
        
        let button2Constraint2 = self.button2!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        button2Constraint2.priority = UILayoutPriority(749)
        button2Constraint2.isActive = true
        
        let button3Constraint1 = self.button3!.leadingAnchor.constraint(equalTo: self.button1!.trailingAnchor, constant: 10)
        button3Constraint1.priority = UILayoutPriority(749)
        button3Constraint1.isActive = true
        
        let button3Constraint2 = self.button3!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        button3Constraint2.priority = UILayoutPriority(749)
        button3Constraint2.isActive = true
    }
    
    
    @objc func buttonAction(_ sender: UIButton) {
        sender.removeFromSuperview()
    }

}

