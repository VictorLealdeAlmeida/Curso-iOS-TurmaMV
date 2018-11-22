//
//  SegundaTelaViewController.swift
//  SeguesMV
//
//  Created by Hilton Pintor Bezerra Leite on 19/11/18.
//  Copyright © 2018 Hilton Pintor Bezerra Leite. All rights reserved.
//

import UIKit

class SegundaTelaViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapColorButton(_ sender: UIButton) {
        var mensagem: String = ""
        
        switch sender {
        case self.redButton:
            mensagem = "Vermelho"
        case self.greenButton:
            mensagem = "Verde"
        case self.blackButton:
            mensagem = "Preto"
        default:
            break
        }
        
        self.colorLabel.text = mensagem
        
    }
    

}
