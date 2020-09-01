//
//  Adress.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 28/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import Foundation
import UIKit

struct AdressModel: Codable {
    var cep: String?
    var logradouro: String?
    var complemento: String?
    var bairro: String?
    var localidade: String?
    var uf: String?
}
