//
//  TbParticipacao.swift
//  TestandoTableview
//
//  Created by Edmilson vieira da silva on 22/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


//let key_titulo: String = "titulo"
//let Key_ano: String = "ano"

class TbParticipacao: Object{
    
    @objc dynamic var id:Int = 0
    @objc dynamic var titulo: String   = ""
    @objc dynamic var ano: String      = ""
    
    
    class func jsonParticipacao(_ json: JSON, _ id :Int) -> TbParticipacao{

        let tb = TbParticipacao()
        tb.id = id
        tb.ano = json[Key_ano].stringValue
        tb.titulo = json[key_titulo].stringValue
           
        return tb ;

       }
    
}
