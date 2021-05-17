//
//  ViewController.swift
//  UIViewProgramatica
//
//  Created by Edmilson vieira da silva on 03/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let tableView = UITableView()
  var array :[CellModel] = []
  
  var friends = ["john","Donald","Ronald","Myke","Thomas","Nicolas","Joe","George","Steve","Tim","Marc","Roger","Gregorie","Harris"]

  struct cellIdentifier {
  
    static let cell = "cell"
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Testando table view..."
  //  view.backgroundColor = .green
    tableViewdelegate()
    setupTableView()
     array = fetchData()
    // Do any additional setup after loading the view.
  }
  
  func setupTableView(){
    view.addSubview(tableView)
    //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier.cell)
    tableView.allowsSelection = true
    tableView.isUserInteractionEnabled = true
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
  }
  
  func tableViewdelegate(){
    tableView.delegate = self
    tableView.dataSource = self
    
  }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   /* let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = friends[indexPath.row] */
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.cell) as! CustomTableViewCell
    let array = self.array[indexPath.row]
    cell.set(cellmodel: array)
    
    return cell
  }
  
  
}
extension ViewController{
  
  func fetchData() ->[CellModel]{
    let position1 = CellModel(imagem:Images.favotite, title: "lucas")
    let position2 = CellModel(imagem: Images.favotite, title: "andre")
    
    return [position1,position2]
  }
}

