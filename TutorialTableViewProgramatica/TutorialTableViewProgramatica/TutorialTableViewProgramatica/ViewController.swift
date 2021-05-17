//
//  ViewController.swift
//  TutorialTableViewProgramatica
//
//  Created by Edmilson vieira da silva on 26/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewLugares = UITableView() //// adiciona a table
    //// fonte de dados

    var arrayLugares = [Lugar(nome: "australia", foto: UIImage(named: "Australia")!),
                        Lugar(nome: "Canada", foto: UIImage(named: "Canada")!),
                        Lugar(nome: "chile", foto: UIImage(named: "Chile")!),
                        Lugar(nome: "inglaterra", foto: UIImage(named: "Inglaterra")!),
                        Lugar(nome: "Islandia", foto: UIImage(named: "Islandia")!),
                        Lugar(nome: "japao", foto: UIImage(named: "Japao")!),
                        Lugar(nome: "madagascar", foto: UIImage(named: "Madagascar")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Lugares " /// coeca a configurar os  eslementos visuais
        self.tableViewLugares.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) /// especifica  a posicao no eixo x e y comecando em zero  e   altura e  largura deve ser  a do dispositivo em  uso
        self.view.addSubview(tableViewLugares)
        self.tableViewLugares.dataSource = self
        self.tableViewLugares.delegate = self
        self.tableViewLugares.register(CellLugar.self, forCellReuseIdentifier: "cell")
    }


}
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    /// datasource fontes de dados  e delegate comdportamentos e aparencia
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.arrayLugares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellLugar
        cell.imageFoto.image = self.arrayLugares[indexPath.row].foto
        cell.labelNome.text = self.arrayLugares[indexPath.row].nome
        
        return cell
    }
    /// determina  a altura  da  linha da celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.2
    }
    
    
}

