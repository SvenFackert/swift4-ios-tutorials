//
//  FirstViewController.swift
//  NavigationControllerCode
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var toSecondButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "First"
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle Color", style: .plain, target: self, action: #selector(FirstViewController.barButtonAction(sender:)))
    }
    
    
    func initializeInterfaceElements() {
        self.toSecondButton = UIButton(type: .system)
        self.toSecondButton!.translatesAutoresizingMaskIntoConstraints = false
        self.toSecondButton!.setTitle("Button", for: .normal)
        self.toSecondButton!.addTarget(self, action: #selector(FirstViewController.buttonAction(sender:)), for: .touchUpInside)
        self.view.addSubview(self.toSecondButton!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.toSecondButton!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15.0).isActive = true
        self.toSecondButton!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
    }
    
    
    @objc func buttonAction(sender: UIButton) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    @objc func barButtonAction(sender: UIBarButtonItem) {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
    }
}

