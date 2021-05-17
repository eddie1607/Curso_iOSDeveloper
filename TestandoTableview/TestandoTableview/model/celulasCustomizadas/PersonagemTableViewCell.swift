//
//  PersonagemTableViewCell.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 04/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import UIKit

class PersonagemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbPersonagem: UILabel!
    @IBOutlet weak var lbNomePersonagem: UILabel!
    @IBOutlet weak var imgPersonagem: UIImageView!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with dt: Personagem){
        lbPersonagem.text = dt.personagem
        lbNomePersonagem.text = dt.nome
       // imgPersonagem.image = UIImage(named: "iconMarvel1024.png")
     }}

