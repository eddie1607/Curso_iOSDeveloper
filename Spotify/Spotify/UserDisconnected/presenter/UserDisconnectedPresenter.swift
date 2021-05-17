//
//  UserDisconnectedPresenter.swift
//  Spotify
//
//  Created by Edmilson vieira da silva on 01/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
class UserDisconnectedPresenter: UserDisconnectedModuleInterface {
    var router: UserDisconnectedRouter?
    
    func createAccountAction() {
        router?.presentCreateAccountInterface()
    }
    
    func loginAction() {
        
    }
    
    
}
