import UIKit

var str = "Hello, playground"

// Dúvida sobre propriedades opcionais

struct Nome {
    var primeiroNome: String
    var segundoNome: String?
}
struct Pessoa {
    var nome: Nome?
}

let semNome = Pessoa()
let maria = Pessoa(nome: Nome(primeiroNome: "Maria", segundoNome: "José"))

semNome.nome?.segundoNome
maria.nome?.segundoNome


// Exercício de protocolos

protocol Forma {
    func area() -> Float
    func perimetro() -> Float
}


class Circulo: Forma {
    var raio: Float
    
    init(raio: Float) {
        self.raio = raio
    }
    
    func area() -> Float {
        return Float.pi * pow(self.raio, 2)
    }
    
    func perimetro() -> Float {
        return 2 * .pi * self.raio
    }
}

let circle = Circulo(raio: 1)
circle.area()
circle.perimetro()

