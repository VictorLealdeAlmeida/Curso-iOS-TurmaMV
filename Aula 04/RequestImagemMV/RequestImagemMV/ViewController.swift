//
//  ViewController.swift
//  RequestImagemMV
//
//  Created by Hilton Pintor Bezerra Leite on 23/11/18.
//  Copyright © 2018 Hilton Pintor Bezerra Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func tapDownloadImageButton(_ sender: Any) {
        let imageURL = URL(string: "https://media.lovemondays.com.br/logos/fdbb55/mv-original.png")!
        
        let dataTask = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        
        dataTask.resume()
    }
    
}

