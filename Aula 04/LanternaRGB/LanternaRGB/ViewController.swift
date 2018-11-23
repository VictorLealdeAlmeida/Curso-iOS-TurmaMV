//
//  ViewController.swift
//  LanternaRGB
//
//  Created by Victor Leal Porto de Almeida Arruda on 23/11/18.
//  Copyright © 2018 Victor Leal Porto de Almeida Arruda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet weak var tomada: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizarValor()
        
    }
    
    @IBAction func mudarSlider(_ sender: UISlider) {
        
        atualizarValor()
        
    }
    
    @IBAction func mudarSwitch(_ sender: UISwitch) {
        
        atualizarValor()
        
    }
    
    func atualizarValor(){
        
        if tomada.isOn{
            view.backgroundColor = UIColor(red: CGFloat(sliders[0].value), green: CGFloat(sliders[1].value), blue: CGFloat(sliders[2].value), alpha: 1)
        }else{
            view.backgroundColor = UIColor.black
        }
        
    }
    
}


