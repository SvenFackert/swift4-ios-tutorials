//
//  ViewController.swift
//  SizeClassesCode
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstImageView: UIImageView?
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    var morePicturesButton: UIButton?
    var readMoreButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    func initializeInterfaceElements() {
        self.firstImageView = UIImageView()
        self.firstImageView!.translatesAutoresizingMaskIntoConstraints = false
        self.firstImageView!.image = UIImage(named: "elCapitan1")
        self.firstImageView!.contentMode = .scaleAspectFill
        self.firstImageView!.clipsToBounds = true
        self.view.addSubview(firstImageView!)
        
        self.titleLabel = UILabel()
        self.titleLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel!.font = UIFont.systemFont(ofSize: 24.0)
        self.titleLabel!.textAlignment = NSTextAlignment.center
        self.titleLabel!.text = "El Capitan"
        self.view.addSubview(self.titleLabel!)
        
        self.descriptionLabel = UILabel()
        self.descriptionLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel!.numberOfLines = 0
        self.descriptionLabel!.text = "El Capitán is composed almost entirely of El Capitán Granite, a pale, coarse-grained granite emplaced approximately 100 mya (million years ago). In addition to El Capitán, this granite forms most of the rock features of the western portions of Yosemite Valley. A separate intrusion of igneous rock, the Taft Granite, forms the uppermost portions of the cliff face. A third igneous rock, diorite, is present as dark-veined intrusions through both kinds of granite, especially prominent in the area known as the North America Wall.[5] Along with most of the other rock formations of Yosemite Valley, El Capitán was carved by glacial action. Several periods of glaciation have occurred in the Sierra Nevada, but the Sherwin Glaciation, which lasted from approximately 1.3 million years ago (mya) to 1 mya, is considered to be responsible for the majority of the sculpting. The El Capitán Granite is relatively free of joints, and as a result the glacial ice did not erode the rock face as much as other, more jointed, rocks nearby.[6] Nonetheless, as with most of the rock forming Yosemite's features, El Capitán's granite is under enormous internal tension brought on by the compression experienced prior to the erosion that brought it to the surface. These forces contribute to the creation of features such as the Texas Flake, a large block of granite slowly detaching from the main rock face about halfway up the side of the cliff."
        self.view.addSubview(self.descriptionLabel!)
        self.descriptionLabel!.setContentCompressionResistancePriority(UILayoutPriority(749), for: UILayoutConstraintAxis.vertical)
        self.descriptionLabel!.setContentHuggingPriority(UILayoutPriority(249), for: UILayoutConstraintAxis.vertical)
        
        self.morePicturesButton = UIButton(type: .system)
        self.morePicturesButton!.translatesAutoresizingMaskIntoConstraints = false
        self.morePicturesButton!.setTitle("More pictures", for: UIControlState())
        self.view.addSubview(self.morePicturesButton!)
        
        self.readMoreButton = UIButton(type: .system)
        self.readMoreButton!.translatesAutoresizingMaskIntoConstraints = false
        self.readMoreButton!.setTitle("Read More", for: UIControlState())
        self.view.addSubview(self.readMoreButton!)
    }

    
    func autolayoutInterfaceElements() {
        self.firstImageView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.firstImageView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.firstImageView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.firstImageView!.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5, constant: -20.0).isActive = true
        
        self.titleLabel!.topAnchor.constraint(equalTo: self.firstImageView!.bottomAnchor, constant: 10.0).isActive = true
        self.titleLabel!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        self.titleLabel!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        
        self.descriptionLabel!.topAnchor.constraint(equalTo: self.titleLabel!.bottomAnchor, constant: 20.0).isActive = true
        self.descriptionLabel!.leadingAnchor.constraint(equalTo: self.titleLabel!.leadingAnchor).isActive = true
        self.descriptionLabel!.trailingAnchor.constraint(equalTo: self.titleLabel!.trailingAnchor).isActive = true
        self.descriptionLabel!.setContentCompressionResistancePriority(UILayoutPriority(200), for: .vertical)
        
        self.readMoreButton!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15.0).isActive = true
        self.readMoreButton!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
        
        self.morePicturesButton!.topAnchor.constraint(greaterThanOrEqualTo: self.descriptionLabel!.bottomAnchor, constant: 20.0).isActive = true
        self.morePicturesButton!.firstBaselineAnchor.constraint(equalTo: self.readMoreButton!.firstBaselineAnchor).isActive = true
        self.morePicturesButton!.trailingAnchor.constraint(equalTo: self.readMoreButton!.leadingAnchor, constant: -15.0).isActive = true
        self.morePicturesButton!.widthAnchor.constraint(equalTo: self.readMoreButton!.widthAnchor).isActive = true
    }
    
}

