//
//  UserViewModel.swift
//  MVVM_Pratica2
//
//  Created by Edmilson vieira da silva on 10/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol UserViewModelProtocol{
    
    func requestUser(user: User)
    
    var userDidChange:((UserViewModelProtocol) ->())? {get set}
    
    var response: String? {get}
}

class ViewModel:UserViewModelProtocol{
    
    var userDidChange: ((UserViewModelProtocol) -> ())?
    
    var response: String?{
        didSet{
            self.userDidChange?(self)
        }
    }
    
    func requestUser(user: User) {
        guard let userName = user.userNameComplete, let userPasswd = user.userPassword  else {return}
        
            if userName == "Jobs" && userPasswd == "Apple" {
                
                let user = User(userNameComplete: userName, userPassword: userPasswd, UserProfileCompany: "Apple Inc.")
                
                   self.response = "Usuário \(user.userNameComplete!), \(user.UserProfileCompany!)"
            }else {
                   self.response = "Usuário \(userName), não autenticado"
                 }
    }
    
  
    
   
    
    
}
