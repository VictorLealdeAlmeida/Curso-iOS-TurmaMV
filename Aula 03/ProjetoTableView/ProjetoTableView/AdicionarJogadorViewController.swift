//
//  AdicionarJogadorViewController.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 17/11/18.
//

import UIKit

class AdicionarJogadorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var viewControllerPrincipal: ViewController!
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var selecao: UITextField!
    @IBOutlet weak var numero: UITextField!
    @IBOutlet weak var imagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func enviar(_ sender: UIButton) {
        
        let nomeJ = self.nome.text!
        let selecaoJ = self.selecao.text!
        let numeroJ = Int(self.numero.text!)!
        let imageJ = imagem.image!
        
        let jogador = Jogador(nome: nomeJ, selecao: selecaoJ, image: imageJ, numero: numeroJ)
        
        viewControllerPrincipal.addPlayer(jogador: jogador)
        
        self.dismiss(animated: true)
    }
    
    @IBAction func abrirGaleria(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagemGaleria = UIImagePickerController()
            imagemGaleria.delegate = self
            imagemGaleria.sourceType = .photoLibrary;
            imagemGaleria.allowsEditing = true
            self.present(imagemGaleria, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imagem.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)

    }
    
    
    
    
    
  

    
    
    
    
}
