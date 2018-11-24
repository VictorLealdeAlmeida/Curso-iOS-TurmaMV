//
//  ViewController.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 15/11/18.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let dados = BancaDados.shared
    
    @IBOutlet weak var jogadoresTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jogadoresTableView.dataSource = self
        self.jogadoresTableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return self.dados.jogadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = jogadoresTableView.dequeueReusableCell(withIdentifier: "jogadorCell") as! JogadorTableViewCell
        
        cell.nomeJogador.text = self.dados.jogadores[indexPath.row].nome
        cell.selecaoJogador.text = self.dados.jogadores[indexPath.row].selecao
        cell.numeroJogador.text = "#" + String(self.dados.jogadores[indexPath.row].numero)
        cell.imagemJogador.image = self.dados.jogadores[indexPath.row].dataImage.image
        
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.dados.jogadores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    func addPlayer (jogador: Jogador){
        let newIndexPath = IndexPath(row: self.dados.jogadores.count, section: 0)
        self.dados.jogadores.append(jogador)
        self.jogadoresTableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    
    @IBAction func adicionarJogador(_ sender: UIButton) {
        
        performSegue(withIdentifier: "paraTelaAdicionar", sender: nil)
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "paraTelaAdicionar"{
            if let vcDestino = segue.destination as? AdicionarJogadorViewController{
                
                vcDestino.viewControllerPrincipal = self
                
            }
        }
        
    }
    
    
    
}
