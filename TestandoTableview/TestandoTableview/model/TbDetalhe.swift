//
//  TbDetalhe.swift
//  TestandoTableview
//
//  Created by Edmilson vieira da silva on 22/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import Foundation
import RealmSwift

class TbDetalhe: Object{
       @objc dynamic var ator: String       = ""
       @objc dynamic var Descricao: String   = ""
       let lstDetalhes = List<TbParticipacao>()
    
    
}
