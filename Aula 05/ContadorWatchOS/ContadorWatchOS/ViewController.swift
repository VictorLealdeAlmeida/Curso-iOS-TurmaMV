//
//  ViewController.swift
//  ContadorWatchOS
//
//  Created by Victor Leal Porto de Almeida Arruda on 24/11/18.
//  Copyright © 2018 Victor Leal Porto de Almeida Arruda. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate{
    
    @IBOutlet weak var contagem: UILabel!
    var contador = 0
    
    let sessao = WCSession.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ativarConexao()
        
    }
    
    func ativarConexao(){
        if WCSession.isSupported(){
            self.sessao.delegate = self
            self.sessao.activate()
        }
    }
    
    
    @IBAction func somarUm(_ sender: Any) {
        self.contador += 1
        self.contagem.text = String(self.contador)
     
        enviarMensagem(messagem: ["contador" : self.contador])
        
    }
    
    @IBAction func zerar(_ sender: Any) {
        self.contador = 0
        self.contagem.text = String(self.contador)
        
        enviarMensagem(messagem: ["contador" : self.contador])
    }
    
    func enviarMensagem(messagem: [String : Any]){
        self.sessao.sendMessage(messagem,
                                replyHandler: {(resposta) in print(resposta)},
                                errorHandler: {(erro) in print(erro)})
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        if let contadorConexao = message["contador"] as? Int{
            
            DispatchQueue.main.async {
                self.contador = contadorConexao
                self.contagem.text = String(self.contador)
            }
            
            let messagemVolta = ["messagem":"tudo certo"]
            replyHandler(messagemVolta)
       
        }else if let nomeDispositivo = message["messagem"] as? String{
            
            switch nomeDispositivo{
            case "pegarNome":
                let messagemVolta = UIDevice.current.name
                replyHandler(["messagem" : messagemVolta])
            default:
                break
            }
            
        }
        
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationState")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
}





