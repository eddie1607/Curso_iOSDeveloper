//
//  ViewController.swift
//  MVVM_Pratica
//
//  Created by Edmilson vieira da silva on 09/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblResponse: UILabel!

    var viewModel: UserViewModelProtocol!{
        didSet{
            self.viewModel.userDidChange = {(viewModel) in
                self.lblResponse.text = viewModel.response
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = UserViewModel()
    
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapped(_ sender: UIButton) {
        let user = User(userNameComplete: txtName.text, userPassword:txtPassword.text, UserProfileCompany:nil)
        viewModel.requestUser(user: user)
    
    }
    


}

