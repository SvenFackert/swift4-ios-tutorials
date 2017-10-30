//
//  SecondViewController.swift
//  FirstApp
//
//  Created by Daniel Lauer on 31/10/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("second viewDidLoad")
    }

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("second viewWillAppear")
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("second viewDidAppear")
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("second viewWillDisappear")
}

override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("second viewDidDisappear")
}


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    print("second didReceiveMemoryWarning")
}

}
