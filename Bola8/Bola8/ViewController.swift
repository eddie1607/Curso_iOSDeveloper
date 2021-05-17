//
//  ViewController.swift
//  Bola8
//
//  Created by Edmilson vieira da silva on 05/06/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBall: UIImageView!
    let images = ["ball1","ball2","ball3","ball4","ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*numero randomico para  definir bola dinamicamente
         a feito um cast obrigatorio para  converer o numero
         i
         */
       shakeDevice()
    }
    
    /*simular o chocalhar do  smart  phoene
     */
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let numberBall = Int(arc4random_uniform(5))
               imageBall.image = UIImage(named: images[numberBall])
    }
    func shakeDevice(){
        let numberBall = Int(arc4random_uniform(5))
        imageBall.image = UIImage(named: images[numberBall])
    }

}

