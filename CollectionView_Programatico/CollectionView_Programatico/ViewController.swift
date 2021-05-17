//
//  ViewController.swift
//  CollectionView_Programatico
//
//  Created by Edmilson vieira da silva on 14/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    ///criar uma  instancia de collectionview um bloco de codigo a ser executado
    ///lazy diz que o bloco de codigo sera executadsso de  forma  atrazado depois dso didload
   lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout() ///1- atribui-se um layout
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout) /// 2-atribui-se um frame
        c.translatesAutoresizingMaskIntoConstraints = false /// 3-esta afirmando que as  constraints serão em linha de codigo
        
        c.delegate = self /// 8- como não setrata dae UICollectionViewControler é necessario declarar o delegate e datasource
        c.dataSource = self //// 9-  declarando datasource
        //// passo 10  instanciar controller deve ser wfeieto no Appdelegate
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid") //// 7 -registrar tra a classe e identifeir
        view.addSubview(cv) ///4 - é necessario adicionar a collection view a view principal
        //// 5 - adiciona-se as constrains-> utilisa-se a linguagem visual format
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|",options:NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : cv]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|",options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : cv]))
    }


}

//// 6 - é necessario declarar o  data source fontes de dados  e  delegateFlowlayout (para customizar a cell)
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        ///// toda a vez que se utiliza o dequeue é preciso registrar o identifier celula
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
        cell.backgroundColor = .yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,height: 200)
    }
    
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtindexPath: IndexPath) ->CGSize{
        return CGSize(width: collection.frame, height: 200)
    }*/
    
        
}

