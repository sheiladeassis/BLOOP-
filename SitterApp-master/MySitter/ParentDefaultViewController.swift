//
//  ParentDefaultViewController.swift
//  MySitter
//
//  Created by Michael Janvier on 2/13/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import MapKit

class ParentDefaultViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var MainMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 40.7440, longitude: -74.0324)
        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
        MainMap.delegate = self
        let annotation = MKPointAnnotation()
        annotation.title = "Sheila De Assis"
        annotation.subtitle = "Available for 3 hours.."
        annotation.coordinate = CLLocationCoordinate2DMake(40.7440, -74.0324)
        MainMap.addAnnotation(annotation)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKUserLocation) {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))
            
            let rightButton = UIButton(type: .contactAdd)
            rightButton.tag = annotation.hash
            
            pinView.animatesDrop = true
            pinView.canShowCallout = true
            pinView.rightCalloutAccessoryView = rightButton
            
            return pinView
        }
        else {
            return nil
        }
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            self.performSegue(withIdentifier: "SitterSelect", sender: self)
            
        }
    }

    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!,
                 calloutAccessoryControlTapped control: UIControl!) {
        
    }
    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        MainMap.setRegion(coordinateRegion, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
