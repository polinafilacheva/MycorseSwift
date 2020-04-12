//
//  ViewController.swift
//  navegation
//
//  Created by POLINA FILACEVA on 13.02.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    var coordinatesArray = [CLLocationCoordinate2D]()
    var annotationsArray = [MKAnnotation]()
    var overlaysArray = [MKOverlay]()
    
    
    @IBOutlet weak var startLocation: UITextField!
    @IBOutlet weak var finishLocation: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func GetYourRoute(_ sender: UIButton) {
        let completion1 = doAfterOne
        if self.mapView.annotations.count > 0 {
            self.mapView.removeAnnotations(self.annotationsArray)
            self.annotationsArray = []
        }
        if self.overlaysArray.count > 0 {
            self.mapView.removeOverlays(self.overlaysArray)
            self.overlaysArray = []
        }
        
        self .coordinatesArray = []
        if (self.startLocation.text!.count == 0) || (self.finishLocation.text!.count == 0) {
            return
        }
        
        //DispatchQueue.global(qos: .background).async {
            self.findLocation(location: self.startLocation.text!, showRegion: false, completion: completion1)
        //}
    }
    
    func doAfterOne() {
        let completion2 = findLocations
        findLocation(location: self.finishLocation.text!, showRegion: true, completion: completion2)
        
        if self.coordinatesArray.count < 2 {
            return
        }
    }
    
    func findLocations() {
        let markLOcatiomOne = MKPlacemark(coordinate: self.coordinatesArray.first!)
        let markLOcatiomTwo = MKPlacemark(coordinate: self.coordinatesArray.last!)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: markLOcatiomOne)
        directionRequest.destination = MKMapItem(placemark: markLOcatiomTwo)
        directionRequest.transportType = MKDirectionsTransportType.automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate { (response, error) in
            if error != nil {
                print("\(String(describing: error))")
            } else {
                let myRoute: MKRoute? = response?.routes.last
                if let a = myRoute?.polyline {
                    if self.overlaysArray.count > 0 {
                        self.mapView.removeOverlays(self.overlaysArray)
                        self.overlaysArray = []
                    }
                    self.overlaysArray.append(a)
                    self.mapView.addOverlay(a)
                    self.mapView.centerCoordinate = self.coordinatesArray.last!
                    let span = MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9)
                    let region = MKCoordinateRegion(center: self.coordinatesArray.last!, span: span)
                    self.mapView.setRegion(region, animated: false)
                    self.mapView.setRegion(region, animated: true)
                }
                
            }
        }
    }
    
    
    func findLocation(location: String, showRegion: Bool = false, completion: @escaping () -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (plasemarks, error) in
            if let plasemark = plasemarks?.first {
                let coordinates = plasemark.location!.coordinate
                self.coordinatesArray.append(coordinates)
                let point = MKPointAnnotation()
                point.coordinate = coordinates
                point.title = location
                if let country = plasemark.country {
                    point.subtitle = country
                }
                
                self.mapView.addAnnotation(point)
                self.annotationsArray.append(point)
                if showRegion {
                    self.mapView.centerCoordinate = coordinates
                    let span = MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9)
                    let region = MKCoordinateRegion(center: coordinates, span: span)
                    self.mapView.setRegion(region, animated: false)
                }
            } else {
                print("\(String(describing: error))")
            }
            
            completion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polilineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if overlay is MKPolyline {
            polilineRenderer.strokeColor = UIColor.green
            polilineRenderer.lineWidth = 5
        }
        return polilineRenderer
    }
}

