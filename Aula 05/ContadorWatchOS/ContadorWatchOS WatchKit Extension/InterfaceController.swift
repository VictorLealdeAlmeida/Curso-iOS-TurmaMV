//
//  InterfaceController.swift
//  ContadorWatchOS WatchKit Extension
//
//  Created by Victor Leal Porto de Almeida Arruda on 24/11/18.
//  Copyright © 2018 Victor Leal Porto de Almeida Arruda. All rights reserved.
//

import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController , WCSessionDelegate{
 
    @IBOutlet weak var contagem: WKInterfaceLabel!
    @IBOutlet weak var labelConexao: WKInterfaceLabel!
    var contador = 0
    
    let sessao = WCSession.default
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        ativarConexao()
        
  
        
    }
    
    func ativarConexao(){
        if WCSession.isSupported(){
            self.sessao.delegate = self
            self.sessao.activate()
        }
    }
    
    @IBAction func somarUm() {
        contador += 1
        contagem.setText(String(contador))
        

        enviarMensagem(messagem: ["contador" : self.contador])
    }
    
    @IBAction func zerar() {
        contador = 0
        contagem.setText(String(contador))
        
        enviarMensagem(messagem: ["contador" : self.contador])
        
    
    }
    
    func enviarMensagem(messagem: [String : Any]){
        self.sessao.sendMessage(messagem,
                                replyHandler: {(resposta) in print(resposta)},
                                errorHandler: {(erro) in print(erro)})
    }

    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        sessao.sendMessage(["messagem" : "pegarNome"],
                           replyHandler: {(messagemVolta) in
                            
                            DispatchQueue.main.async {

                                self.labelConexao.setText(messagemVolta["messagem"] as? String)
                                
                            }
                            
        }, errorHandler: {(erro) in print("erro:", erro)})
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        if let contadorConexao = message["contador"] as? Int{
            
            DispatchQueue.main.async {
                self.contador = contadorConexao
                self.contagem.setText(String(self.contador))
            }
            
            let messagemVolta = ["messagem":"tudo certo"]
             replyHandler(messagemVolta)
        }
        
    }
    
}
