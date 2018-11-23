//
//  ViewController.swift
//  restAPIMV
//
//  Created by Hilton Pintor Bezerra Leite on 23/11/18.
//  Copyright © 2018 Hilton Pintor Bezerra Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.requestUsers()
    }
    
    func requestUsers() {
        let getURL = URL(string: "https://api.github.com/users")!
        
        var getRequest = URLRequest(url: getURL)
        getRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: getRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let data = data {
                do {
                    let users = try JSONDecoder().decode(Users.self, from: data)

                    print("Encontrei \(users.count) Usuários")
                    print("O nome do primeiro é: \(users[0].login!) ")

                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }.resume()
    }

}
