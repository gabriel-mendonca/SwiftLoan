//
//  DepositarViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class DepositarViewController: UIViewController {

    @IBOutlet weak var textValue: TextFieldSublinhada!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textValue.delegate = self
        self.textValue.TipoMascaraUsar = 3

    }


}
