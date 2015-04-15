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
    
    
    //Fala o que fazer caso o segue GoToMaps seja selecionado
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (segue!.identifier == "GoToMaps") {
            
            //declar o indexPath. Ele puxa o index da célula selecionada da tableView Teatros
            let indexPath = Teatros.indexPathForSelectedRow()
            
            //Escolhe qual lista está sendo mostrada e de que cidade deve ser puxada a informação
            switch Escolhida! {
                
            //Usa o index recebido para escolher qual item da Cidade Escolhida foi clicado
                
            case "Campinas":
                let TeatroEscolhido = Campinas[indexPath!.row]
                
            case "São Paulo":
                let TeatroEscolhido = SaoPaulo[indexPath!.row]
                
            case "Holambra":
                let TeatroEscolhido = Holambra[indexPath!.row]
                
            case "Jacareí":
                let TeatroEscolhido = Jacarei[indexPath!.row]
                
            case "Paulínia":
                let TeatroEscolhido = Paulinia[indexPath!.row]
                
            default:
                let TeatroEscolhido = Campinas[indexPath!.row]
            
            
            //Escolhe a próxima view controller a ser mostrada
            let mapsVC:MapsVC = segue!.destinationViewController as! MapsVC
            //Aqui teria que colocar o que vamos passar para a proxima VC de informaçao. Tipo o endereço do teatro, que ela vai pegar e mandar pro maps, ou fazer o aminho
            //TeatroEscolhido.Endereco
        }
    }

    }
}