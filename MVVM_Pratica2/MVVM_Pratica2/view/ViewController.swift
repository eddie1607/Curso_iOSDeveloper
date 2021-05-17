//
//  ViewController.swift
//  MVVM_Pratica2
//
//  Created by Edmilson vieira da silva on 10/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    var viewModel: UserViewModelProtocol!{
        didSet{
            self.viewModel.userDidChange = { (viewModel)  in
                self.lblResponse.text = viewModel.response
            }
        }
    }
    @IBAction func didTapped(_ sender: UIButton) {
        let user = User(userNameComplete: txtName.text, userPassword: txtPassword.text, UserProfileCompany: nil)
        //transferido a responsabilidade para o viewmodel
        viewModel.requestUser(user: user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewModel = ViewModel()
     
    }


}

