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

    
    
@IBOutlet weak var Teatros: UITableView!
///Identifier da célula da tableview Teatros
let TeatrosReuseIdentifier: String = "TeatrosReuseIdentifier"
    

///TableView para os Teatros
var Campinas = ["Castro Mendes", "Casarão", "Casa do Lago", "Lume"]
var SaoPaulo = ["Centro Cultural", "Teatro Municipal"]
var Holambra = ["Teatro Moinho", "Teatro Flores"]
var Jacarei = ["EducaMais"]
var Paulinia = ["Teatro Municipal"]
    
    
//Váriavel que vai ser urilizada para trazer CidadeEscolhida e ListaCidades
let Escolha = ViewController()
    
    
//Define a TableView para os teatros
func tableView(Teatros: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //Informa os itens de qual lista devem ser contados para exibir
    switch(Escolha.CidadeEscolhida){
        
    case "Campinas":
        return Campinas.count
        
    case "S˜o Paulo":
        return SaoPaulo.count
        
    case "Holambra":
        return Holambra.count
        
    case "Jacareí":
        return Jacarei.count
        
    case "Paulínia":
        return Paulinia.count
        
    default:
        //Conta a lista de cidades
        return Escolha.ListaCidades.count
        
    }
}
    
    
///Define o conteúdo de cada célula, conforme seu indexPath (número da linha)
func tableView(Teatros: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    
    //Escolhe qual lista será exibida, declara e cria a célula a partir da célula definida em CelulaTeatros
    switch(Escolha.CidadeEscolhida){
        
    case "Campinas":
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Campinas[indexPath.row]
        
    case "São Paulo":
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = SaoPaulo[indexPath.row]
        
    case "Holambra":
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Holambra[indexPath.row]
        
    case "Jacareí":
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Jacarei[indexPath.row]
        
    case "Paulínia":
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Paulinia[indexPath.row]
        
    default:
        ///Em caso de cidade errada mostra a lista de Cidades
        let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Celula.Teatro.text = Escolha.ListaCidades[indexPath.row]
        
    }
    
    
    return CelulaTeatros()
}

///Faz com que cidade escolhida recebe o número da linha clicada, para depois usarmos para escolher a outra lista a ser utilizada na outra tableview
func tableView(Teatros: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    switch(Escolha.CidadeEscolhida){
        
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
        println(Escolha.ListaCidades[indexPath.row])
        
    }
    
    
}
}

