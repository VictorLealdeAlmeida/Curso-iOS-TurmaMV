//
//  ViewController.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 15/11/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    let jogador1 = Jogador(nome: "Marcelo", selecao: "Brasil", image: #imageLiteral(resourceName: "marcelo"), numero: 6)
    
    let jogador2 = Jogador(nome: "Kane", selecao: "Inglaterra", image: #imageLiteral(resourceName: "Kane-Inglaterra"), numero: 9)
    
    let jogador3 = Jogador(nome: "Van Persie", selecao: "Holanda", image: #imageLiteral(resourceName: "Robin_Van_Persie1"), numero: 9)
    
    let jogador4 = Jogador(nome: "Hulk", selecao: "Brasil", image: #imageLiteral(resourceName: "hulk"), numero: 19)
    
    
    lazy var jogadores = [jogador1, jogador2, jogador3, jogador4]

    
    
    @IBOutlet weak var jogadoresTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jogadoresTableView.dataSource = self
        self.jogadoresTableView.delegate = self
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jogadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = jogadoresTableView.dequeueReusableCell(withIdentifier: "jogadorCell") as! JogadorTableViewCell
        
        cell.nomeJogador.text = self.jogadores[indexPath.row].nome
        cell.selecaoJogador.text = self.jogadores[indexPath.row].selecao
        cell.numeroJogador.text = "#" + String(jogadores[indexPath.row].numero)
        cell.imagemJogador.image = self.jogadores[indexPath.row].image
        
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.jogadores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    func addPlayer (jogador: Jogador){
        let newIndexPath = IndexPath(row: jogadores.count, section: 0)
        jogadores.append(jogador)
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

