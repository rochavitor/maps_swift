
import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///Primeira table view. Contém as cidades
    @IBOutlet weak var Cidades: UITableView!
    
    ///Identifier da célula da tableview Cidades
    let CidadeReuseIdentifier: String = "CidadeReuseIdentifier"
    
    
    ///Controla a cidade que vai ser chamada pela tableview Teatros
    
    
    ///Array com cidades
    var ListaCidades = ["Campinas", "São Paulo", "Holambra", "Jacareí", "Paulínia"]
    
    ///Define o número de linhas da tabela e a quantidade de células, contando o número de itens da ListaCidades
    func tableView(Cidades: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaCidades.count
    }
    
    
    ///Define o conteúdo de cada célula, conforme seu indexPath (número da linha)
    func tableView(Cidades: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        ///Declara e cria a çelula a partir da célula definida em CelulaCidades
        let Celula: CelulaCidades = self.Cidades.dequeueReusableCellWithIdentifier(CidadeReuseIdentifier, forIndexPath: indexPath) as! CelulaCidades
        //Iguala o texto da label Cidade, da celula, ao nome da Cidade do mesmo indexPath da ListaCidades
        Celula.Cidade.text = ListaCidades[indexPath.row]
        
        return Celula
    }
    
    //Fala o que fazer caso o segue GoToFuture seja selecionado
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (segue!.identifier == "GoToTeatro") {
            
            //declar o indexPath. Ele puxa o index da célula selecionada da tableView Cidades
            let indexPath = Cidades.indexPathForSelectedRow()
           
            
            //Usa o index recebido para escolher qual item da ListaCidades deve ser passado para a CidadeEscolhida, declarada na viewController seguinte
            let CidadeEscolhida = ListaCidades[indexPath!.row]
            
            
            //Escolhe a próxima view controller a ser mostrada
            let tableView2VC:TableView2VC = segue!.destinationViewController as! TableView2VC
            tableView2VC.Escolhida = CidadeEscolhida
            
        }
    }
    
    
}

