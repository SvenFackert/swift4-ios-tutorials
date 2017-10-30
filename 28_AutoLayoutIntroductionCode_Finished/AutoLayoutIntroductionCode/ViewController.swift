//
//  ViewController.swift
//  AutoLayoutIntroductionCode
//
//  Created by Daniel Lauer on 12/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var registrationLabel: UILabel?
    var firstNameLabel: UILabel?
    var lastNameLabel: UILabel?
    var emailLabel: UILabel?
    var resultLabel: UILabel?
    var firstNameTextField: UITextField?
    var lastNameTextField: UITextField?
    var emailTextField: UITextField?
    var resetButton: UIButton?
    var sendButton: UIButton?
    var containerView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    func initializeInterfaceElements() {
    
        self.registrationLabel = UILabel()
        self.registrationLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.registrationLabel!.textAlignment = .center
        self.registrationLabel!.font = UIFont.boldSystemFont(ofSize: 24.0)
        self.registrationLabel!.text = "Registration"
        self.view.addSubview(self.registrationLabel!)
        
        self.firstNameLabel = UILabel()
        self.firstNameLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameLabel!.text = "First Name:"
        self.view.addSubview(self.firstNameLabel!)
        
        self.firstNameTextField = UITextField()
        self.firstNameTextField!.translatesAutoresizingMaskIntoConstraints = false
        self.firstNameTextField!.borderStyle = .roundedRect
        self.view.addSubview(self.firstNameTextField!)
        
        self.lastNameLabel = UILabel()
        self.lastNameLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameLabel!.text = "Last Name:"
        self.view.addSubview(self.lastNameLabel!)
        
        self.lastNameTextField = UITextField()
        self.lastNameTextField!.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameTextField!.borderStyle = .roundedRect
        self.view.addSubview(self.lastNameTextField!)
        
        self.emailLabel = UILabel()
        self.emailLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.emailLabel!.text = "E-Mail:"
        self.view.addSubview(self.emailLabel!)
        
        self.emailTextField = UITextField()
        self.emailTextField!.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField!.borderStyle = .roundedRect
        self.view.addSubview(self.emailTextField!)
        
        self.resetButton = UIButton(type: .system)
        self.resetButton!.translatesAutoresizingMaskIntoConstraints = false
        self.resetButton!.setTitle("Reset", for: .normal)
        self.resetButton!.addTarget(self, action: #selector(ViewController.resetButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.resetButton!)
        
        self.sendButton = UIButton(type: .system)
        self.sendButton!.translatesAutoresizingMaskIntoConstraints = false
        self.sendButton!.setTitle("Send", for: .normal)
        self.sendButton!.addTarget(self, action: #selector(ViewController.sendButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.sendButton!)
        
        self.containerView = UIView()
        self.containerView!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.containerView!)
        
        self.resultLabel = UILabel()
        self.resultLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.resultLabel!.text = "Result"
        self.resultLabel!.numberOfLines = 0
        self.containerView!.addSubview(self.resultLabel!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.registrationLabel!.topAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        self.registrationLabel!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        self.registrationLabel!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        
        self.firstNameLabel!.topAnchor.constraint(equalTo: self.registrationLabel!.bottomAnchor, constant: 20.0).isActive = true
        self.firstNameLabel!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
        
        self.firstNameTextField!.leadingAnchor.constraint(equalTo: self.firstNameLabel!.trailingAnchor, constant: 20.0).isActive = true
        self.firstNameTextField!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
        self.firstNameTextField!.firstBaselineAnchor.constraint(equalTo: self.firstNameLabel!.firstBaselineAnchor).isActive = true
        self.firstNameTextField!.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        
        self.lastNameLabel!.topAnchor.constraint(equalTo: self.firstNameLabel!.bottomAnchor, constant: 20.0).isActive = true
        self.lastNameLabel!.leadingAnchor.constraint(equalTo: self.firstNameLabel!.leadingAnchor).isActive = true
        self.lastNameLabel!.trailingAnchor.constraint(equalTo: self.firstNameLabel!.trailingAnchor).isActive = true
        
        self.lastNameTextField!.leadingAnchor.constraint(equalTo: self.firstNameTextField!.leadingAnchor).isActive = true
        self.lastNameTextField!.trailingAnchor.constraint(equalTo: self.firstNameTextField!.trailingAnchor).isActive = true
        self.lastNameTextField!.firstBaselineAnchor.constraint(equalTo: self.lastNameLabel!.firstBaselineAnchor).isActive = true
        
        self.emailLabel!.topAnchor.constraint(equalTo: self.lastNameLabel!.bottomAnchor, constant: 20.0).isActive = true
        self.emailLabel!.leadingAnchor.constraint(equalTo: self.lastNameLabel!.leadingAnchor).isActive = true
        self.emailLabel!.trailingAnchor.constraint(equalTo: self.lastNameLabel!.trailingAnchor).isActive = true
        
        self.emailTextField!.leadingAnchor.constraint(equalTo: self.lastNameTextField!.leadingAnchor).isActive = true
        self.emailTextField!.trailingAnchor.constraint(equalTo: self.lastNameTextField!.trailingAnchor).isActive = true
        self.emailTextField!.firstBaselineAnchor.constraint(equalTo: self.emailLabel!.firstBaselineAnchor).isActive = true
        
        self.resetButton!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
        self.resetButton!.bottomAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.bottomAnchor, constant: -15.0).isActive = true
        self.resetButton!.trailingAnchor.constraint(lessThanOrEqualTo: self.sendButton!.leadingAnchor, constant: -20.0)
        
        self.sendButton!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
        self.sendButton!.bottomAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.bottomAnchor, constant: -15.0).isActive = true
        
        self.containerView!.topAnchor.constraint(equalTo: self.emailTextField!.bottomAnchor, constant: 15.0).isActive = true
        self.containerView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
        self.containerView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
        self.containerView!.bottomAnchor.constraint(equalTo: self.resetButton!.topAnchor, constant: -15.0).isActive = true
        
        self.resultLabel!.centerXAnchor.constraint(equalTo: self.containerView!.centerXAnchor).isActive = true
        self.resultLabel!.centerYAnchor.constraint(equalTo: self.containerView!.centerYAnchor).isActive = true
        
        self.resultLabel!.topAnchor.constraint(greaterThanOrEqualTo: self.containerView!.topAnchor).isActive = true
        self.resultLabel!.leadingAnchor.constraint(greaterThanOrEqualTo: self.containerView!.leadingAnchor).isActive = true
        self.resultLabel!.trailingAnchor.constraint(lessThanOrEqualTo: self.containerView!.trailingAnchor).isActive = true
        self.resultLabel!.bottomAnchor.constraint(lessThanOrEqualTo: self.containerView!.bottomAnchor).isActive = true
    }
    
    @objc func resetButtonAction(_ sender: UIButton) {
        self.firstNameTextField!.text = ""
        self.lastNameTextField!.text = ""
        self.emailTextField!.text = ""
        self.resultLabel!.text = ""
    }
    
    @objc func sendButtonAction(_ sender: UIButton) {
        self.resultLabel!.text = "\(self.firstNameTextField!.text!) \(self.lastNameTextField!.text!), \(self.emailTextField!.text!)"
    }
}

