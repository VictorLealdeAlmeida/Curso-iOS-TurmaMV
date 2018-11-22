//
//  Player.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 15/11/18.
//

import UIKit

class Jogador{
    
    var nome: String
    var selecao: String
    var image: UIImage
    var numero: Int
    
    init(nome: String, selecao: String, image: UIImage, numero: Int) {
        self.nome = nome
        self.selecao = selecao
        self.image = image
        self.numero = numero
    }
    
}
