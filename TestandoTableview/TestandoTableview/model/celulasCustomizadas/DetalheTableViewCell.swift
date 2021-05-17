//
//  DetalheTableViewCell.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 04/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import UIKit

class DetalheTableViewCell: UITableViewCell {
    @IBOutlet weak var lbNomePersonagem: UILabel!
    
    @IBOutlet weak var lbpersonagem: UILabel!
    
    @IBOutlet weak var imgPersonagem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with dt: Personagem, _ id: Int){
           lbpersonagem.text = dt.personagem
           lbNomePersonagem.text = dt.nome
        
        if (id == 1){
           imgPersonagem.image = UIImage(named: "homemAranha02.png")
        }else if(id == 2){
            imgPersonagem.image = UIImage(named: "volverine02.png")
        }else if(id == 3){
            imgPersonagem.image = UIImage(named: "superman01.png")
        }
           //imgPersonagem.image = UIImage(named: "iconMarvel1024.png")
        }

}
