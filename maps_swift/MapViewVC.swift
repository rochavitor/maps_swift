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
    
    ///variável de endereço, vai receber o valor do teatro selecionado. Criei sem valor, para conseguir setar lá do TableViewVC
    var address: String?
    
    //cria um outlet que sai da lista de teatros pro mapa
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(address)
        
        
        
        //var address = "RUA RODOLFO GOTTARDELLO, CAMPINAS, SAO PAULO, BRASIL"
        //inicia um geocoder
        var geocoder = CLGeocoder()
        //variáveis das restrições de distância do ponto inicial
        let latdelta: CLLocationDegrees = 0.01
        let longdelta: CLLocationDegrees = 0.01
        
        //variável que estabelece o tamanho da área do mapa a ser mostrada
        let theSpan: MKCoordinateSpan = MKCoordinateSpanMake(latdelta,longdelta)
        
        //função que transforma o endereço em string em coordenadas de longitude e latitude e sete o ponto com sua área no mapa
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error:NSError!) -> Void in
            
            if let placemark = placemarks?[0] as? CLPlacemark{
                
                var location: CLLocation //cria variável de localização que recebe a localização do placemark
                location = placemark.location
                
                var coordinate: CLLocationCoordinate2D //variável que recebe as coordenadas em 2D da localização
                coordinate = location.coordinate
                
                //Variável que utiliza o ponto central e o tamanho da área a ser mostrada
                //para definir a região do mapa que vai ser mostrada
                var theRegion: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, theSpan)
                
                self.MapView.setRegion(theRegion, animated:true) //defina a região no map view
                self.MapView.addAnnotation(MKPlacemark(placemark: placemark)) //coloca o placemark no local selecionado
                
                
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

