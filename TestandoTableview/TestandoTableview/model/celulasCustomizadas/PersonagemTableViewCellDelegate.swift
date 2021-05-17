//
//  PersonagemTableViewCellDelegate.swift
//  TestandoTableview
//
//  Created by EprExatron1 on 05/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//
import UIKit
import Foundation
protocol PersonagemTableViewCellDelegate : class{
    func didSelect(_ cell: UITableViewCell,button: UIButton)
}

class personagemTableViewCell: UITableViewCell{
    
       weak var delegate: PersonagemTableViewCellDelegate? // vindos da storyboard
       //@IBOutlet weak var btn: UIButton!
      // @IBAction func btnAction(_ sender: Any) {
       //    delegate?.didSelect(self, btn)
      //}
       
       //@IBOutlet weak var texLabel: UILabel!
       
       //captar apenas a selecao de celula
    /*   var controlConfiguration: ControlConfiguration!{
    didSe{
           
               prepare()
       
           }
      } */
     
       override class func awakeFromNib() {
           super.awakeFromNib()
       }
    
       //configuracaoa interna do botao
       func prepare (){
          // texLabel?.text! = controlConfiguration.title
          // let titulo: String = controlConfiguration.title
         //  btn.setTitle(titulo, for: .normal)
         // btn.text(controlConfiguration.title)
          // btn.isHidden = false
          // btn.isEnabled = true
         
           
       }}
