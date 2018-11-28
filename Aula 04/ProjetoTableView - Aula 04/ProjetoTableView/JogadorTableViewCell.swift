//
//  JogadorTableViewCell.swift
//  ProjetoTableView
//
//  Created by Victor Leal Porto de Almeida Arruda on 15/11/18.
//

import UIKit

class JogadorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeJogador: UILabel!
    @IBOutlet weak var selecaoJogador: UILabel!
    @IBOutlet weak var numeroJogador: UILabel!
    @IBOutlet weak var imagemJogador: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
