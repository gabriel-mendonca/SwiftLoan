//
//  InformacaoHistorico.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import Foundation
import UIKit

class InformacaoHistorico {
    
    var titulo: String
    var imagem: UIImage
    var valor: String
    
    init(title: String,image: UIImage,value: String) {
        self.titulo = title
        self.imagem = image
        self.valor = value
    }
    
}
