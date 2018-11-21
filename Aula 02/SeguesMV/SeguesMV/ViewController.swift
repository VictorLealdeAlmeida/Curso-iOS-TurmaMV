//
//  ViewController.swift
//  SeguesMV
//
//  Created by Hilton Pintor Bezerra Leite on 19/11/18.
//  Copyright © 2018 Hilton Pintor Bezerra Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
        if let segundoVC = unwindSegue.source as? SegundaTelaViewController {
            let corEscolhida = segundoVC.colorLabel.text!
            var corBackground: UIColor?
            self.colorLabel.text = corEscolhida
            
            switch corEscolhida {
            case "Vermelho":
                corBackground = .red
            case "Preto":
                corBackground = .black
            case "Verde":
                corBackground = UIColor.green
            default:
                break
            }
            
            self.view.backgroundColor = corBackground
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

