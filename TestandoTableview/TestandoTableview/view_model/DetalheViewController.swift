//
//  DetalheViewController.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 04/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import UIKit
import SwiftyJSON
import LabelConfigurator
import RealmSwift

import RxCocoa
import RxSwift
import RxRealm

class DetalheViewController: UIViewController {
  
    var personagen: Personagem!
    var jsonObject: JSON = []
    var part:JSON = []
    var detalhes: Detalhe!
    var par:[String:String] = [:]
    var arrayPart:[String] = []
    var id: Int = 0
    
    @IBOutlet weak var tbParticipacoes: UITableView!
    @IBOutlet weak var lbNomeAtor: UILabel!
    @IBOutlet weak var lbDescricao: UILabel!
    @IBOutlet weak var participacao: UILabel!
    @IBOutlet weak var btnParticipacao: UIButton!
    @IBOutlet weak var imgAtor: UIImageView!
    
    @IBOutlet weak var viewParticacoes: UIView!
    @IBAction func btnParticipacaoAction(_ sender: Any) {
        viewParticacoes.isHidden = false
    }
    
    @IBOutlet weak var viewDetalhe: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewParticacoes.isHidden = true
        tbParticipacoes.delegate = self
        tbParticipacoes.dataSource = self
         tbParticipacoes.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           let  par =  self.part.array
           let id = personagen.id
        self.id = id - 1
        print("-----------------id selecionado----------------\n\(id)")
       // print("nome\(String(describing: personagens.personagem))")
        // Do any additional setup after loading the view.
        //lbNomeAtor.text = personagens.nome
        
        //lbDescricao.text = "\( personagens.detalhe)"
      //  print("carregou os dados na viewController2 : \n\(self.jsonObject.arrayValue)")
        self.loadPersonagens2()
    }
        func loadPersonagens2(){
             
            if let detalhes = jsonObject[self.id]["detalhe"].array  {
                loadPicture(self.id)
                // if let detalhes = jsonObject["detalhe"].array  {

                    //let descricao = jsonObj[1]["descricao"].stringValue
                   // let controlsList: List<TbPersonagem> = List<TbPersonagem>()
                    let ator = ["ator"]
                    let participacao = ["participacao"]
                   // let arrayNames =  jsonObject["participacao"].arrayValue.map {$0["ator"].stringValue}
                   // print(detalhes)

                    for detalhe in detalhes{
                        let descricao = detalhe["descricao"].stringValue
                        // print(">>>>>>>>>>>>>>>>>"+descricao)
                        lbDescricao.text = descricao
                        self.lbDescricao.setLabelText(descricao)
                        .set(font: UIFont.boldSystemFont(ofSize: 14))
                                   .set(textColor: .blue)
                                   .configure()
                        let  ator = detalhe["ator"].stringValue
                        lbNomeAtor.text = ator
                      //   print(">>>>>>>>>>>>>>>>>"+ator)
                let pys = detalhe["participacao"].arrayValue ///// obtem o  array de objetos json participacao
        
                let participacoes = detalhe["participacao"].arrayValue.map {["Participacao": $0["titulo"].stringValue, "ano": $0["ano"].stringValue]} ////// transforma em dicionario
                        
                        for part in pys{
                           
                        var titulo = part["titulo"].stringValue
                        var  ano = part["ano"].stringValue
                         
                            arrayPart.append("\(titulo) - \(ano)")
                            
                        }
                         print(">>>>>>>  meu array de participacoes >>>>>>>>>>\( arrayPart )")
                    }
                    // print(">>>>>>>>>>>>>>>>>"+descricao)
                }
    }
    
    func loadPicture(_ id:Int){
        
        
        if(id + 1 == 1){
            imgAtor.image = UIImage(named: "Tom Holland")
        }else if(id + 1 == 2){
             imgAtor.image = UIImage(named: "Hugh Jackman")
        }else if(id + 1 == 3){
             imgAtor.image = UIImage(named: "henry Cavill")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 extension DetalheViewController:UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
         //worldCup.matches.count
        return 1
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         //let games = worldCup.matches[section].games
        return arrayPart.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! let //personagens = self.personagens[indexPath.row]
     
        
       //  print("neu array de participacoes ++++++}}}}}_____)))))\n\(par)")
        //cell.prepare(with: personagens)
         cell.textLabel?.text = "\(arrayPart[indexPath.row])"
        // cell.detailTextLabel?.text = "\(personagens.nome)"
        //cell.imageView?.image = UIImage(named: "todos herois juntos.png")
         return cell
     }
     
     
 }
 extension DetalheViewController: UITableViewDelegate{
     
 }
