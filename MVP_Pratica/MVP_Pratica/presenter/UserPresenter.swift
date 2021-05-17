//
//  UserPresenter.swift
//  MVP_Pratica
//
//  Created by Edmilson vieira da silva on 09/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol UserPresenterProtocol{
    init(view:LoginView) /// referencia da  tela passiva
    func requestUser(user: User)
    
}

class UserPresenter: UserPresenterProtocol {
    
    let view: LoginView
    required init(view: LoginView) {
        self.view = view
    }
    // presenter realiza
    func requestUser(user: User) {
        guard let username = user.userNameComplete, let userpassword = user.userPassword else{ return }
        if username == "" || userpassword == "" {
            self.view.setResponse(textResponse: "Usuario  ou senha invalido")
        }
        if username == "Jobs" && userpassword == "Apple"{
            let user = User(userNameComplete: username, userPassword: userpassword, userProfileCompany: "Apple inc")
            self.view.setResponse(textResponse: "Usuario:\(user.userNameComplete) \n \(user.userProfileCompany)")
        }
        else{
            self.view.setResponse(textResponse: "Usuario \(user.userNameComplete) nao autenticado")
        }
        
        
    }
    
    
    
}
