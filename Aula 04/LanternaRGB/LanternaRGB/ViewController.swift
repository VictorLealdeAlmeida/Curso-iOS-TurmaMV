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
    
    var dados = Dados.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliders[0].value = dados.sliderR
        sliders[1].value = dados.sliderG
        sliders[2].value = dados.sliderB
        tomada.isOn = dados.tomada
        
        atualizarValor()
        
    }
    
    @IBAction func mudarSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            self.dados.sliderR = sender.value
        case 1:
            self.dados.sliderG = sender.value
        case 2:
            self.dados.sliderB = sender.value
        default:
            break
        }
        
        atualizarValor()
        
    }
    
    @IBAction func mudarSwitch(_ sender: UISwitch) {
        
        self.dados.tomada = sender.isOn
        
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


