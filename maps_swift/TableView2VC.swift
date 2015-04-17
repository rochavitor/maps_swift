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
    var TeatroEscolhido = "nill"

    
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
var Campinas = [["Castro Mendes", "Rua Conselheiro Gomide, 62 , Campinas, São Paulo, Brasil"], ["Casarão", "Rua Maria Ribeiro Sampaio Reginato, Campinas, São Paulo, Brasil"], ["Casa do Lago", "Avenida Érico Veríssimo, 1011, Campinas, São Paulo, Brasil"], ["Lume", "Rua Carlos Diniz Leitão, 150"]]
var SaoPaulo = [["Centro Cultural São Paulo", "Rua Vergueiro 1000, São Paulo, São Paulo, Brasil"], ["Teatro Municipal", "Praça Ramos de Azevedo, São Paulo, São Paulo, Brasil"]]
var Holambra = ["Teatro Moinho", "Teatro Flores"]
var Jacarei = [["EducaMais", "Avenida Davi Lino , 595, Jacareí, São Paulo, Brasil"]]
var Paulinia = [["Teatro Municipal", "Avenida José Lozano de Araújo, 1551, Paulínia, São Paulo, Brasil"]]
    
    


    
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
        Celula.Teatro.text = Campinas[indexPath.row][0]
        
    case "São Paulo":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = SaoPaulo[indexPath.row][0]
        
    case "Holambra":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Holambra[indexPath.row]
        
    case "Jacareí":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Jacarei[indexPath.row][0]
        
    case "Paulínia":
        //Iguala o texto da label Cidade, da celula, ao nome do Teatro do mesmo indexPath da lista escolhida
        Celula.Teatro.text = Paulinia[indexPath.row][0]
        
    default:
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Celula.Teatro.text = Campinas[indexPath.row][0]
        
    }
    
    
    return Celula
}

    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (segue!.identifier == "GoToMaps") {
            
            //declara o indexPath. Ele puxa o index da célula selecionada da tableView Cidades
            let indexPath = Teatros.indexPathForSelectedRow()
            
            
            //Necessario codificar o prepareforsegue para pegar o endereço do teatro selecionado e jogar na variavel address do MapViewVC para o Maps abrir com este endereço selecionado.
            
            switch Escolhida! {
                
            case "Campinas":
                //Passa o endereço do teatro escolhido
                TeatroEscolhido = Campinas[indexPath!.row][1]
                
            case "São Paulo":
                //Passa o endereço do teatro escolhido
                TeatroEscolhido = SaoPaulo[indexPath!.row][1]
                
            case "Holambra":
                //Passa o endereço do teatro escolhido
                TeatroEscolhido = Holambra[indexPath!.row]
                
            case "Jacareí":
                //Passa o endereço do teatro escolhido
                TeatroEscolhido = Jacarei[indexPath!.row][1]
                
            case "Paulínia":
                //CidadeEscolhida = indexPath.row
                TeatroEscolhido = Paulinia[indexPath!.row][1]
                
            default:
                TeatroEscolhido = Campinas[indexPath!.row][1]
                
            }
            
            
            
            //Escolhe a próxima view controller a ser mostrada
            let mapViewVC:MapViewVC = segue!.destinationViewController as! MapViewVC
            
            //Passa o endereço paa a variável que o maps utiliza
            mapViewVC.address = TeatroEscolhido
            
        }
    }
    
    
    
    
    
    
    
}

