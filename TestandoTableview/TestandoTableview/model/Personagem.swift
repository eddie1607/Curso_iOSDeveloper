//
//  Personagem.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 04/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import Foundation
struct Personagem: Codable{
    var personagem:String
    var nome:String
    var detalhe:[Detalhe]
    var id:Int
}
