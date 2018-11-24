//
//  Dados.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 23/11/18.
//

import UIKit

class BancaDados{
    
    let defatults = UserDefaults.standard
    static let shared: BancaDados = BancaDados()
    
    var jogadores: [Jogador]{
        get{
            let data = defatults.value(forKey: "jogadores") as! Data
            let jogadoresSalvos = try! PropertyListDecoder().decode(Array<Jogador>.self, from: data)
            return jogadoresSalvos
        }
        set(novosJogadores){
            let encodedArray = try! PropertyListEncoder().encode(novosJogadores)
            defatults.set(encodedArray, forKey: "jogadores")
        }
    }
    
    private init(){
        if defatults.value(forKey: "jogadores") == nil{
            
            let jogador1 = Jogador(nome: "Marcelo", selecao: "Brasil", dataImage: #imageLiteral(resourceName: "marcelo").data!, numero: 6)
            
            let jogador2 = Jogador(nome: "Kane", selecao: "Inglaterra", dataImage: #imageLiteral(resourceName: "Kane-Inglaterra").data!, numero: 9)
            
            let jogador3 = Jogador(nome: "Van Persie", selecao: "Holanda", dataImage: #imageLiteral(resourceName: "Robin_Van_Persie1").data!, numero: 9)
            
            let jogador4 = Jogador(nome: "Hulk", selecao: "Brasil", dataImage: #imageLiteral(resourceName: "hulk").data!, numero: 19)
            
            let encodedArray = try! PropertyListEncoder().encode([jogador1, jogador2, jogador3, jogador4])
            defatults.set(encodedArray, forKey: "jogadores")
            
            if let data = defatults.value(forKey: "jogadores") as? Data {
                let jogadoresSalvos = try! PropertyListDecoder().decode(Array<Jogador>.self, from: data)
                print(jogadoresSalvos[0].nome)
            }
            
        }
    }
    
}
