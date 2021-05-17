//
//  ViewController.swift
//  UsandoXIB
//
//  Created by Edmilson vieira da silva on 25/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    ////// conjuto de dados que deve aparecer na table view
    let dogs = ["maçã","pera","uva","banana","laranja","figo","melão","mamão","kiwi"]
    let num = ["1","2","3","4","5","6","7","8","9"]
    
    ///criar  tableview Programatica
  /*  var tbl:UITableView = {
      
        let v = UITableView(frame: .zero, style: .plain)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }() */
    
    var tbl:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        navigationItem.title = " frutas "
        tbl.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(tbl)
        
        //2 inserindo autolayout o metodo a ser usado deve ser  Array d NsConstrains
      /*  view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : tbl]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : tbl])) */
        
        //3 registrando protocolos
        tbl.delegate = self
        tbl.dataSource = self
        
        // 4  registrar a celula a ser usada
      //  tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        //4 caso estaja usando XIB
        self.registerTableViewCell()
        

        
      
   
    }
    
     // metodo que registra a celula xib
    private  func registerTableViewCell(){
        let textFieldCell = UINib(nibName: "TableViewCell", bundle: nil)
        self.tbl.register(textFieldCell, forCellReuseIdentifier: "TableViewCell")
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // caso o registro  tenha usado  o passo 4
       /* let cell = tableView.dequeueReusableCell(withIdentifier: "cellid")!
        cell.textLabel?.text = dogs[indexPath.row]
        cell.imageView?.image = UIImage(named: "apple")
         return cell
         */
        
        // caso o registro  tenha  usado o passo 4  XIB
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell{
            cell.nameLabel.text = dogs[indexPath.row]
            cell.ageLabel.text = num[indexPath.row]
            cell.userImage.image = UIImage(named: "apple")
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    
}


