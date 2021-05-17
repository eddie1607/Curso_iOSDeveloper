//
//  ViewController.swift
//  MVP_Pratica
//
//  Created by Edmilson vieira da silva on 09/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

protocol LoginView{
    func setResponse(textResponse:String)
}
/// Essa passa a ser um aview passiva  ela apenas  devera envar dados e acoes do usuario para o presenter e ele é que decidira oque fazer
class TelaViewController: UIViewController,LoginView {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    ///criado uma referencia de presenter para apenas enviar dados
    var presenter:UserPresenterProtocol! //desacopla  a classe a ser usada agura pode ser  userpresente mas dpois pode ser xptoUser presenter por exemplo
    
    
    ///a view captura os eventsos e acoes do usuario e  envia   para  o presenter
    @IBAction func didTapped(_ sender: UIButton) {
        let user = User(userNameComplete: txtName.text, userPassword: txtPassword.text, userProfileCompany: nil)
            presenter.requestUser(user: user)
      
    }
    func setResponse(textResponse: String) {
        lblResponse.text = textResponse
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UserPresenter(view: self)
        // Do any additional setup after loading the view.
    }

   
     

}

