//
//  CellLugar.swift
//  TutorialTableViewProgramatica
//
//  Created by Edmilson vieira da silva on 26/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import  UIKit

class CellLugar: UITableViewCell {
    var labelNome: UILabel!
    var imageFoto: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tamanhoTela = UIScreen.main.bounds ///usa porcenntagens
        let larguraTela = tamanhoTela.width
        let alturaTela = tamanhoTela.height*0.2
        
        self.imageFoto = UIImageView(frame: CGRect(x: larguraTela * 0.05, y: alturaTela * 0.05, width: larguraTela * 0.6, height: alturaTela*0.9))
        self.labelNome = UILabel(frame: CGRect(x: larguraTela * 0.7, y: 0, width: larguraTela*0.3, height: alturaTela/2))
        self.labelNome.center.y = alturaTela/2
        self.addSubview(labelNome)
        self.addSubview(imageFoto)
        
    }
    
    // xcode solicita auomaticamente
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
