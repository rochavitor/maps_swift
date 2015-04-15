//
//  TableView2VC.swift
//  maps_swift
//
//  Created by Gabarron on 14/04/15.
//  Copyright (c) 2015 Vítor Machado Rocha. All rights reserved.
//

import Foundation
import UIKit

class TableView2VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//////TableView para os Teatros
var Campinas = ["Castro Mendes", "Casarão", "Casa do Lago", "Lume"]
var SaoPaulo = ["Centro Cultural", "Teatro Municipal"]
var Holambra = ["Teatro Moinho", "Teatro Flores"]
var Jacarei = ["EducaMais"]
var Paulinia = ["Teatro Municipal"]

    let Escolha: CidadeEscolhida ViewController
    
//Define a TableView para os teatros
func tableView(Teatros: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch(CidadeEscolhida){
        
    case "Campinas":
        return Campinas.count
        
    case "SaoPaulo":
        return SaoPaulo.count
        
    case "Holambra":
        return Holambra.count
        
    case "Jacarei":
        return Jacarei.count
        
    case "Paulinia":
        return Paulinia.count
        
    default:
        return 0
        break
    }
}
///Define o conteúdo de cada célula, conforme seu indexPath (número da linha)
func tableView(Teatros: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    switch(CidadeEscolhida){
        
    case "Campinas":
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Teatro: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Teatro.Teatros.text = Campinas[indexPath.row]
        
    case "SaoPaulo":
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Teatro: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Teatro.Teatros.text = SaoPaulo[indexPath.row]
        
    case "Holambra":
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Teatro: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Teatro.Teatros.text = Holambra[indexPath.row]
        
    case "Jacarei":
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Teatro: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Teatro.Teatros.text = Jacarei[indexPath.row]
        
    case "Paulinia":
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Teatro: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Teatro.Teatros.text = Paulinia[indexPath.row]
        
    default:
        break
    }
    
    
    return CelulaTeatros()
}

///Faz com que cidade escolhida recebe o número da linha clicada, para depois usarmos para escolher a outra lista a ser utilizada na outra tableview
func tableView(Teatros: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    switch(CidadeEscolhida){
        
    case "Campinas":
        //CidadeEscolhida = indexPath.row
        println(Campinas[indexPath.row])
        
    case "SaoPaulo":
        //CidadeEscolhida = indexPath.row
        println(SaoPaulo[indexPath.row])
        
    case "Holambra":
        //CidadeEscolhida = indexPath.row
        println(Holambra[indexPath.row])
        
    case "Jacarei":
        //CidadeEscolhida = indexPath.row
        println(Jacarei[indexPath.row])
        
    case "Paulinia":
        //CidadeEscolhida = indexPath.row
        println(Paulinia[indexPath.row])
        
    default:
        break
    }
    
    
}
}

