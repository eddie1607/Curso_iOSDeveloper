//
//  Habito.swift
//  ToDoEdmilson
//
//  Created by Edmilson vieira da silva on 06/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import  UIKit

struct Habito {
    var nome: String?
    var image: UIImage?
    
    init(nome: String , imagem: UIImage) {
        self.nome = nome
        self.image = imagem
    }
}
