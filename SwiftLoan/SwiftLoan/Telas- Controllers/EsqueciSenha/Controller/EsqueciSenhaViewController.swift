//
//  EsqueciSenhaViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 28/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class EsqueciSenhaViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var btnEmail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSendEmail(_ sender: UIButton) {
        
        self.validate()
        
    }
    
    private func validate() {
        
        guard (self.textEmail.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite um email")
            return
        }
        
        guard (self.textEmail.text ?? "").isEmailValido() else {
            self.alerta(title: "Aviso", mensagem: "Digite um email valido")
            return
        }
        
        let alert = UIAlertController(title: "Sucesso!", message: "Email enviado com sucesso!", preferredStyle: .alert)
        
        alert.addAction(.init(title: "OK", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "screenEntrar", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

}
