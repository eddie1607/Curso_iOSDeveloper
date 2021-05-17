//
//  PersonagensTableViewController.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 04/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

import RxCocoa
import RxSwift
import RxRealm
import UIScrollView_InfiniteScroll /// paginacao infinita

class PersonagensTableViewController: UITableViewController {

        var personagens: [Personagem]    = []
        var NomePersonagem:[String]      = []
        var detathes: [Detalhe]          = []
        var partic:[Participacao]        = []
        var jsonObject: JSON             = []
        var id: Int                      = 0
    
    @IBOutlet var tbPersonagens: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //////// manipulador de rolagem infinita
        tableView.addInfiniteScroll { (tableView) -> Void in
            // update table view
            //self.tableView.reloadData()
            // finish infinite scroll animation
            self.tableView.finishInfiniteScroll()
        }
       tableView.beginInfiniteScroll(true)
    
       tbPersonagens.register(UITableViewCell.self, forCellReuseIdentifier: "personagemCell")
            self.loadPersonagens()
            self.loadDataFromJson()

    }
    
    //////  substitui a chamada de rede
    func loadPersonagens(){
        
        let url         = Bundle.main.url(forResource: "personagens", withExtension:"json" )
        let jsonData    = try! Data(contentsOf: url!,options: .alwaysMapped)
        let jsonObject  = JSON(jsonData)
        do{
            personagens = try JSONDecoder().decode([Personagem].self, from: jsonData)
    
         }catch{
            
             print(error.localizedDescription)
              print("nao decodificou")
         }
     }
    
    func loadDataFromJson(){

        let url = Bundle.main.url(forResource: "personagens", withExtension:"json" )
        
        do{
            let jsonData    = try! Data(contentsOf: url!,options: .alwaysMapped)
            let jsonObj     = try JSON(data: jsonData)
            self.jsonObject = jsonObj
            jsonToObject(jsonObject)
           // carregaDados(jsonObj)
            if let detalhes = jsonObj["detalhe"].array  {

            
                for detalhe in detalhes{
                    let descricao = detalhe["descricao"].stringValue
                     print(">>>>>>>>>>>>>>>>>"+descricao)
                    let  ator = detalhe["ator"].stringValue
                     print(">>>>>>>>>>>>>>>>>"+ator)
                    let participacao = detalhe["participacao"].arrayValue
                    print(">>>>>>>>>>>>>>>>>\(participacao)")

                }
            }

            }catch{
                    print(error.localizedDescription)
                     print("nao decodificou")
            }
    }
    
    ////// ler  o  JSON e  comecar a  parceal-lo em  estruturas de dados array e variaveis
      func jsonToObject(_ json: JSON ){
         
          let jsonPersonagens = json.arrayValue
        //let nomes = json["personagem"].arrayValue.map{$0["nome"].stringValue}

          for(person) in jsonPersonagens
          {
            let nome = person["nome"].stringValue
            let personagem = person["personagem"].stringValue
            let detalhes = person["detalhe"].arrayValue
            let id = person["id"].intValue
            print(">>>>>>>>>.\(id)")
            print(">>>>>>>>>.\(nome)")
            print(">>>>>>>>>.\(personagem)")
                    
            for detalhe in detalhes{
                let ator = detalhe["ator"].stringValue
                let descricao = detalhe["descricao"].stringValue
                print(">>>>>>>>>.\(ator)")
                print(">>>>>>>>>.\(descricao)")
                let participacao = detalhe["participacao"].arrayValue
                print(">>>>>>>>>.\(participacao)")
            }
               
          }
          
      }
    /////////  bd
    func carregaDados(_ json: JSON){
        let realm = try! Realm()
      
        let arrayJson = json.arrayValue
        for json in arrayJson{
          
           try! realm.write {
           
           TbPersonagem.jsonObject(json)
          
            
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personagens.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var vc           = segue.destination as!DetalheViewController
        let personagem = personagens [tableView.indexPathForSelectedRow!.row]
           vc.personagen = personagem
           vc.jsonObject = self.jsonObject  /// substituivel pelo realm
         
            //performSegue(withIdentifier: "SegueAddControlesDispositivosFabricantes", sender: //personagens[indexPath.row ]
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personagemcell", for: indexPath) as! DetalheTableViewCell

        let personagens = self.personagens[indexPath.row]
        
        // print(personagens)
        cell.prepare(with: personagens,personagens.id)
         //cell.textLabel?.text = "\(personagens.personagem)"
         //cell.detailTextLabel?.text = "\(personagens.nome)"
        //cell.imageView?.image = UIImage(named: "todos herois juntos.png")

        return cell
    }
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                 
                 performSegue(withIdentifier: "segueDetalhe", sender: personagens[indexPath.row])
                 loadDataFromJson()
         }
    

}
