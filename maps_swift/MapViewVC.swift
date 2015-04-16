//
//  ViewController.swift
//  Teste MapKit
//
//  Created by Gabarron on 15/04/15.
//  Copyright (c) 2015 Gabarron. All rights reserved.
//

import UIKit

class MapViewVC: UIViewController{
    
    ///Variável de endereço, vai receber o valor do teatro selecionado. Criei sem valor, para conseguir setar lá do TableViewVC
    var address: String?
    
    
    
    //cria um outlet que sai da lista de teatros pro mapa
    @IBOutlet weak var MapView: TEMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(address)
        self.MapView.setAddress(address);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

