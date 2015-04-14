//
//  ViewController.swift
//  maps_swift
//
//  Created by Vítor Machado Rocha on 14/04/15.
//  Copyright (c) 2015 Vítor Machado Rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.Cidades.registerClass(CelulaCidades().self, forCellReuseIdentifier: CidadeReuseIdentifier!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///Primeira table view. Contém as cidades
    @IBOutlet weak var Cidades: UITableView!
    ///Identifier da célula da tableview Cidades
    let CidadeReuseIdentifier: String = "CidadeReuseIdentifier"
    
    ///Segunda table view. Com os teatros
    @IBOutlet weak var Teatros: UITableView!
    ///Identifier da célula da tableview Teatros
    let TeatrosReuseIdentifier: String = "TeatrosReuseIdentifier"
    
    
    ///Controla a cidade que vai ser chamada pela tableview Teatros
    var CidadeEscolhida = 0
    
    ///Array com cidades
    var ListaCidades = ["Campinas", "São Paulo", "Holambra", "Jacareí", "Paulínia"]
    var Campinas = ["Castro Mendes", "Casarão", "Casa do Lago", "Lume"]
    var SaoPaulo = ["Centro Cultural", "Teatro Municipal"]
    var Holambra = ["Teatro Moinho", "Teatro Flores"]
    var Jacarei = ["EducaMais"]
    var Paulinia = ["Teatro Municipal"]
    
    ///Define o número de linhas da tabela e a quantidade de células, contando o número de itens da ListaCidades
    func tableView(Cidades: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaCidades.count
    }
    
    
    ///Define o conteúdo de cada célula, conforme seu indexPath (número da linha)
    func tableView(Cidades: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        ///Declara e cria a çelula a partir da célula criada em CelulaCidades
        let Celula: CelulaCidades = self.Cidades.dequeueReusableCellWithIdentifier(CidadeReuseIdentifier, forIndexPath: indexPath) as! CelulaCidades
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Celula.Cidade.text = ListaCidades[indexPath.row]
        
        return CelulaCidades()
    }
    
    //Faz com que cidade escolhida recebe o número da linha clicada, para depois usarmos para escolher a outra lista a ser utilizada na outra tableview
    func tableView(Cidades: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        CidadeEscolhida = indexPath.row
        }
    
}

