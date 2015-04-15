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
    
    ///Váriavel que recebe da ViewController a CidadeEscolhida, através do segue
    var Escolhida: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(Escolhida)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
@IBOutlet weak var Teatros: UITableView!
///Identifier da célula da tableview Teatros
let TeatrosReuseIdentifier: String = "TeatrosReuseIdentifier"
    

///Arrays de cada cidade
var Campinas = ["Castro Mendes", "Casarão", "Casa do Lago", "Lume"]
var SaoPaulo = ["Centro Cultural", "Teatro Municipal"]
var Holambra = ["Teatro Moinho", "Teatro Flores"]
var Jacarei = ["EducaMais"]
var Paulinia = ["Teatro Municipal"]
    
    


    
//Define a TableView para os teatros
func tableView(Teatros: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
    //Informa os itens de qual lista devem ser contados para exibir
    switch Escolhida! {
        
    case "Campinas":
        return Campinas.count
        
    case "São Paulo":
        return SaoPaulo.count
        
    case "Holambra":
        return Holambra.count
        
    case "Jacareí":
        return Jacarei.count
        
    case "Paulínia":
        return Paulinia.count
        
    default:
        //Conta a lista de cidades
        return Campinas.count
        
    }
}
    
    
///Define o conteúdo de cada célula, conforme seu indexPath (número da linha)
func tableView(Teatros: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let Celula: CelulaTeatros = self.Teatros.dequeueReusableCellWithIdentifier(TeatrosReuseIdentifier, forIndexPath: indexPath) as! CelulaTeatros
    
    //Escolhe qual lista será exibida, declara e cria a célula a partir da célula definida em CelulaTeatros
    switch Escolhida! {
        
    case "Campinas":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Campinas[indexPath.row]
        
    case "São Paulo":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = SaoPaulo[indexPath.row]
        
    case "Holambra":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Holambra[indexPath.row]
        
    case "Jacareí":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Jacarei[indexPath.row]
        
    case "Paulínia":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Paulinia[indexPath.row]
        
    default:
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Celula.Teatro.text = Campinas[indexPath.row]
        
    }
    
    
    return Celula
}

///Faz com que cidade escolhida recebe o número da linha clicada, para depois usarmos para escolher a outra lista a ser utilizada na outra tableview
func tableView(Teatros: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    switch Escolhida! {
        
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
        println(Campinas[indexPath.row])
        
    }

    
}
}

