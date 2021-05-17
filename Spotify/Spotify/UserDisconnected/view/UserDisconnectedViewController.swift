//
//  UserDisconnectedViewController.swift
//  Spotify
//
//  Created by Edmilson vieira da silva on 01/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class UserDisconnectedViewController: UIViewController {

    var eventHandler: UserDisconnectedModuleInterface?
       
       let btnCreateAccount: UIButton = {
           let btn = UIButton()
           btn.backgroundColor = .yellow
           btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CREATE ACCOUNT", for: UIControl.State.normal)
           btn.addTarget(self, action: #selector(createAccountDidTapped), for: .touchUpInside)
           return btn
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .green
           
           view.addSubview(btnCreateAccount)
           view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|",
                                                              options: NSLayoutConstraint.FormatOptions(),
                                                              metrics: nil,
                                                              views: ["v0" : btnCreateAccount]))
           
           view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]-16-|",
                                                              options: NSLayoutConstraint.FormatOptions(),
                                                              metrics: nil,
                                                              views: ["v0" : btnCreateAccount]))
           
           navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       }
       
       @objc func createAccountDidTapped() {
           eventHandler?.createAccountAction()
       }
       
       @objc func loginDidTapped() {
           eventHandler?.loginAction()
       }

}
