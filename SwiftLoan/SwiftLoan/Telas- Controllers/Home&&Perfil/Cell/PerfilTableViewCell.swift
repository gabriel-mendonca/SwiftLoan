//
//  PerfilTableViewCell.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class PerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
