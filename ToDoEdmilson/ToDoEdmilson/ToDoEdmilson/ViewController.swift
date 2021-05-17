//
//  ViewController.swift
//  ToDoEdmilson
//
//  Created by Edmilson vieira da silva on 06/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //// 1 passo criar  uma  tableview programaticamente
    var  tableView = UITableView()
    ///  2- passo dados  para popular
    var  items =  [Habito(nome: "Habito a", imagem: UIImage(named: "Image")!),
                   Habito(nome: "Habito b", imagem: UIImage(named: "Image-1")!),
                   Habito(nome: "Habito c", imagem: UIImage(named: "Image-2")!)
                  ]

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = UIColor.red
       // self.title = "TO DO"
        // preenchendo dados
        navigationItem.title = "TO DO " /// coeca a configurar os  eslementos visuais
        // 3 passo  declara a o layout
            self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        // 4 passoregistrar a tabele
     //   self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        // 4.1 registrar tablela usando xib
        self.registrarCelula()
         // 5 passo assinando protocols
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 6- adicionando aadicionando a  subview
        self.view.addSubview(self.tableView)
    }
    
    private  func registrarCelula(){
        let textFiedCell = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(textFiedCell, forCellReuseIdentifier: "TableViewCell")
    }
}
/*1- declara a  tableview
 2-
 */
///// aplicacao do protocols
extension ViewController: UITableViewDataSource,  UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* primeira opcao
        //recuperando um intem
        let  item = self.items[indexPath.row]
        // customizacao da celula
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        tableViewCell.textLabel?.text = item
        return tableViewCell */
        let  item = self.items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell{
            cell.nome.text = item.nome
            cell.imagem.image = item.image
            return cell
        }
        
        return UITableViewCell()
    }
    //////// controla a  altura  da celula 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height*0.2
    }
    
}

