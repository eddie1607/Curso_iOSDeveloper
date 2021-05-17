//
//  CustomTableViewCell.swift
//  UIViewProgramatica
//
//  Created by Edmilson vieira da silva on 03/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  var title = UILabel()
  var imagemView = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(title)
    addSubview(imagemView)
    
    configureTitle()
    configureImageView()
    setConstrainsTitle()
    setConstrainsImageView()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set (cellmodel: CellModel){
    imagemView.image = cellmodel.imagem
    title.text = cellmodel.title
  }
  
  func configureImageView(){
    imagemView.layer.cornerRadius = 10
    imagemView.clipsToBounds      = true
  }
  
  func configureTitle(){
    title.adjustsFontSizeToFitWidth = true
    title.numberOfLines = 0
  }
  
  func setConstrainsImageView(){
    imagemView.translatesAutoresizingMaskIntoConstraints
                = false
    imagemView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive
                = true
    imagemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive
                = true
    imagemView.heightAnchor.constraint(equalToConstant: 80).isActive
                = true
    imagemView.widthAnchor.constraint(equalTo: imagemView.heightAnchor, multiplier: 16/9).isActive
                = true
    
    
  }
  
  func setConstrainsTitle(){
    title.translatesAutoresizingMaskIntoConstraints
                = false
    title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive
                = true
    title.leadingAnchor.constraint(equalTo: imagemView.trailingAnchor,constant: 20).isActive
                = true
    title.heightAnchor.constraint(equalToConstant: 80).isActive
                = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive
                = true
  }
  
  
  
  //MARk: dispensavle nesse primeiro momento

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

