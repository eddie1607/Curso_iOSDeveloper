//
//  ViewController.swift
//  MVC_Pratica
//
//  Created by Edmilson vieira da silva on 07/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

//view e tb controller
class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    //escuta de evento
    //// 0- a view que ira captar as ações do usuario e  envia para o controller
    @IBAction func didTapped(_ sender: Any) {
         validateUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    ///1- a controller ira atualizar a model atraves de uma requisicao
    func validateUser(){
        if let username =  self.txtName.text,let userpass = self.txtPassword.text {
            
            if username == " " || userpass == "" {
                lblResponse.text = " Usuario ou senha  invalido ou incompleto "
            }
            else
            {
                ///controller atualiza a  view com os novos  dados
                 if let user = userRequest(username: username, userpass: userpass)
                 {
                    lblResponse.text = "Usuario Usuario :\(user.userNameComplete),\(user.userProfileCompany) Autenticado "
                 }else{
                    lblResponse.text = "usuario  não logado"
                }
                
            }
        }
    }
    ///controller  atualiza o  model  realizando a atualizacao
    
    func userRequest(username: String, userpass: String) -> User? {
        if username == "Jobs" && userpass == "Apple"{
            ////abaixo o model retorna o controller  a atualizacao feita
            return User (userNameComplete: "Jobs", userProfileCompany: "Apple Inc")
        }
        
        return nil
    }


}

