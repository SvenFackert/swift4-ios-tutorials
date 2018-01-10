//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Daniel Lauer on 25/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    var centerUserPosition: Bool = true
    var lastUserLocation: MKUserLocation?
    var locations: [MKPointAnnotation] = []
    var isUserInteraction: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.createAnnotation()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func createAnnotation() {
        let annoation: MKPointAnnotation = MKPointAnnotation()
        annoation.coordinate = CLLocationCoordinate2DMake(37.313728, -122.044973)
        annoation.title = "Location 1"
        self.locations.append(annoation)
        
        let annoation2: MKPointAnnotation = MKPointAnnotation()
        annoation2.coordinate = CLLocationCoordinate2DMake(36.313728, -121.044973)
        annoation2.title = "Location 2"
        self.locations.append(annoation2)
        
        let annoation3: MKPointAnnotation = MKPointAnnotation()
        annoation3.coordinate = CLLocationCoordinate2DMake(38.313728, -123.044973)
        annoation3.title = "Location 3"
        self.locations.append(annoation3)
        
        self.mapView.addAnnotations(self.locations)
    }

    @IBAction func myLocationBarButtonAction(_ sender: UIBarButtonItem) {
        
        if self.lastUserLocation != nil {
            let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(lastUserLocation!.coordinate, 5000, 5000)
            self.mapView.setRegion(region, animated: true)
            
            let selectedIndexPath: IndexPath? = self.tableView.indexPathForSelectedRow
            if selectedIndexPath != nil {
                self.tableView.deselectRow(at: selectedIndexPath!, animated: true)
            }
        }

    }

}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if self.centerUserPosition {
            let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 5000, 5000)
            self.mapView.setRegion(region, animated: true)
            self.centerUserPosition = false
        }
        
        self.lastUserLocation = userLocation
    }
    
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        // Error
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if self.isUserInteraction {
            let selectedIndexPath: IndexPath? = self.tableView.indexPathForSelectedRow
            if selectedIndexPath != nil {
                self.tableView.deselectRow(at: selectedIndexPath!, animated: true)
            }
        }
        else {
            self.isUserInteraction = true
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        
        let annotation: MKPointAnnotation = self.locations[indexPath.row]
        cell!.textLabel?.text = annotation.title
        
        return cell!
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let annotation: MKPointAnnotation = self.locations[indexPath.row]
        for an in self.mapView.annotations {
            let pointAnnotation: MKPointAnnotation? = an as? MKPointAnnotation
            if pointAnnotation != nil {
                if pointAnnotation == annotation {
                    self.isUserInteraction = false
                    let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 5000, 5000)
                    self.mapView.setRegion(region, animated: true)

                }
            }
        }
    }
}






