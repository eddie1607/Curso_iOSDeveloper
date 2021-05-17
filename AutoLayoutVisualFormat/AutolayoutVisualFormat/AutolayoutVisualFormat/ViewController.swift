//
//  ViewController.swift
//  AutolayoutVisualFormat
//
//  Created by Edmilson vieira da silva on 27/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label:UILabel = {
       // let lb = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 80))
        let lb = UILabel()
        lb.textColor = .white
        lb.textAlignment = NSTextAlignment.center
        lb.text = "Meu UILabel"
        // step2
        lb.translatesAutoresizingMaskIntoConstraints = false  // eu atribuireiaas constrains
        
        // step3
        lb.backgroundColor = UIColor.green
        
        
        
        return lb
    }()
    //criando um segundo componente
    let label2 : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
        lb.textAlignment = NSTextAlignment.center
        lb.text = " Meu UILabel2"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = UIColor.green
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        view.addSubview(label)
        view.addSubview(label2)
        // Do any additional setup after loading the view.
        // step1
        label.center = view.center
        
        //step2
        
        /// exibicao vertical(30) define  um  altura fixa apara  a label, ja o 25 25 define as margens
      /*  view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(30)]-25-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:["v0": label] ))
        
        // exibicao horizontal(200) define um tamanho fixo para a lablel ja 16 16 define as margens
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(200)]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":label])) */
        
        /// exibicao vertical(30) define  um  altura fixa apara  a label, ja o 25 25 define as margens
       /* view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(30)]-25-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:["v0": label] ))
        
        // exibicao horizontal(200) define um tamanho fixo para a lablel ja 16 16 define as margens
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":label])) */
        
        
        
        
        /// configuracao de dois componentes
         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(30)]-25-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:["v0": label] ))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(30)]-25-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":label2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(v1)]-8-[v1]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":label,"v1":label2]))
    
    }


}

