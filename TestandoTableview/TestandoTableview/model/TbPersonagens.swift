//
//  TbPersonagens.swift
//  TestandoTableview
//
//  Created by Edmilson vieira da silva on 21/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

//import Foundation
import RealmSwift
import SwiftyJSON

///////chaves para  trabalhar com json
let Key_personagem:String = "personagem"
let Key_nome:String = "nome"
let Key_detalhe: String = "detalhe"
let Key_ator: String = "ator"
let Key_descricao: String = "descricao"
let key_titulo: String = "titulo"
let Key_ano: String = "ano"
let Key_id: Int = 0

class TbPersonagem: Object{
       @objc dynamic var id: Int              = 0
       @objc dynamic var personagem: String   = ""
       @objc dynamic var nome: String         = ""
      // @objc dynamic var ator: String       = ""
      // @objc dynamic var Descricao: String   = ""
        let lstDetalhes = List<TbDetalhe>()
   
    class TbDetalhe: Object{
   
   // @objc dynamic var personagem: String   = ""
  //  @objc dynamic var nome: String         = ""
    @objc dynamic var ator: String       = ""
    @objc dynamic var descricao: String   = ""
     let lstDetalhesParticipacao = List<TbParticipacao>()
    }
    
    class TbParticipacao: Object{
    
    @objc dynamic var id:Int = 0
    @objc dynamic var titulo: String   = ""
    @objc dynamic var ano: String      = ""
        
    }
    //////// Retorna uma tabela de partaicipacoes
    class func jsonParticipacao(_ json: JSON, _ id :Int) -> TbParticipacao{

        let tb = TbParticipacao()
        let participacoes = json.arrayValue
        
        for participacao in participacoes{
            
         // tb.id     =   id
          tb.ano    =   participacao[Key_ano].stringValue
          tb.titulo =   participacao[key_titulo].stringValue
        }
         return tb ;

    }
    
    ///////    prenche  uma tabela de objetos personagem com seus  respsectivos detalhes
    class func jsonObject(_ json: JSON)
       {

          // let personList: List<TbPersonagem> = List<TbPersonagem>()
           let arrayJsonPersonagens = json.arrayValue
           for(person) in arrayJsonPersonagens
           {
               let id = person["id"].intValue
               let listPersonagem: TbPersonagem = TbPersonagem()
                listPersonagem.id = person[Key_id].intValue
                listPersonagem.nome = person[Key_nome].stringValue
                listPersonagem.personagem = person[Key_personagem].stringValue
            
            
               let jsonDetalhes = person[Key_detalhe].arrayValue
            
               for(dt) in jsonDetalhes
               {
                let listDetalhes: TbDetalhe = TbDetalhe()
                listDetalhes.ator = dt[Key_ator].stringValue
                listDetalhes.descricao = dt[Key_descricao].stringValue
                listDetalhes.lstDetalhesParticipacao.append(jsonParticipacao( dt, id))
               // lstDetalhes.append(<#T##object: TbPersonagem.TbDetalhe##TbPersonagem.TbDetalhe#>)

               }

           }

       }
    
}
