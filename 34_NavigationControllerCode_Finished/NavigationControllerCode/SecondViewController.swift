//
//  SecondViewController.swift
//  NavigationControllerCode
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var toThirdButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Second"
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Item", style: .plain, target: self, action: nil), UIBarButtonItem(title: "Item", style: .plain, target: self, action: nil), UIBarButtonItem(title: "Item", style: .plain, target: self, action: nil), UIBarButtonItem(title: "Item", style: .plain, target: self, action: nil)]
    }

    func initializeInterfaceElements() {
        self.toThirdButton = UIButton(type: .system)
        self.toThirdButton!.translatesAutoresizingMaskIntoConstraints = false
        self.toThirdButton!.setTitle("Button", for: .normal)
        self.toThirdButton!.addTarget(self, action: #selector(SecondViewController.buttonAction(sender:)), for: .touchUpInside)
        self.view.addSubview(self.toThirdButton!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.toThirdButton!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15.0).isActive = true
        self.toThirdButton!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
    }
    
    
    @objc func buttonAction(sender: UIButton) {
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
}
