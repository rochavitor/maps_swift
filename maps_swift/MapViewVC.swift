//
//  ViewController.swift
//  Teste MapKit
//
//  Created by Gabarron on 15/04/15.
//  Copyright (c) 2015 Gabarron. All rights reserved.
//

import UIKit
import MapKit

class MapViewVC: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        var address = "RUA RODOLFO GOTTARDELLO, CAMPINAS, SAO PAULO, BRASIL"
        var geocoder = CLGeocoder()
        var latdelta: CLLocationDegrees = 0.01
        var longdelta: CLLocationDegrees = 0.01
        
        var theSpan: MKCoordinateSpan = MKCoordinateSpanMake(latdelta,longdelta)
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error:NSError!) -> Void in
            if let placemark = placemarks?[0] as? CLPlacemark{
                
                var location: CLLocation
                location = placemark.location
                var coordinate: CLLocationCoordinate2D
                coordinate = location.coordinate
                var theRegion: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, theSpan)
                self.MapView.setRegion(theRegion, animated:true)
                self.MapView.addAnnotation(MKPlacemark(placemark: placemark))
                
                
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

