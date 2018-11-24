//
//  Player.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 15/11/18.
//

import UIKit

class Jogador: Codable{
    
    var nome: String
    var selecao: String
    var dataImage: Data
    var numero: Int
    
    init(nome: String, selecao: String, dataImage: Data, numero: Int) {
        self.nome = nome
        self.selecao = selecao
        self.dataImage = dataImage
        self.numero = numero
    }
    
}

extension UIImage {
    var data: Data? {
        if let data = self.jpegData(compressionQuality: 1.0) {
            return data
        } else {
            return nil
        }
    }
}

extension Data {
    var image: UIImage? {
        if let image = UIImage(data: self) {
            return image
        } else {
            return nil
        }
    }
}
