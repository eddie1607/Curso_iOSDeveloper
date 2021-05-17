//
//  LoginUserViewInterface.swift
//  VIPER_Pratica
//
//  Created by Edmilson vieira da silva on 11/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol  LoginUserViewInterface
{
    func setUserName(name:String)
    func setpassword(passwd:String)
    func showUserUnautenticate()
    func showSuccessLogin(message:String)
}
