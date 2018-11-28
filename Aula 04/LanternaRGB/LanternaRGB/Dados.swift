//
//  Dados.swift
//  LanternaRGB
//
//  Created by Victor Leal Porto de Almeida Arruda on 23/11/18.
//  Copyright © 2018 Victor Leal Porto de Almeida Arruda. All rights reserved.
//

import Foundation

class Dados{
    
    
    let defaults = UserDefaults.standard
    static let shared: Dados = Dados()
    
    var sliderR: Float{
        get{
          return defaults.float(forKey: "sliderR")
        }
        set{
            defaults.set(newValue, forKey: "sliderR")
        }
        
    }
    
    var sliderG: Float{
        get{
            return defaults.float(forKey: "sliderG")
        }
        set{
            defaults.set(newValue, forKey: "sliderG")
        }
        
    }
    
    var sliderB: Float{
        get{
            return defaults.float(forKey: "sliderB")
        }
        set{
            defaults.set(newValue, forKey: "sliderB")
        }
        
    }
    
    var tomada: Bool{
        get{
            return defaults.bool(forKey: "tomada")
        }
        set{
            defaults.set(newValue, forKey: "tomada")
        }
    }
    
    private init(){
        
    }
    
    
}






