//
//  LoginViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 28/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var btnForgot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textEmail.text = "gabriel@gmail.com"
        self.textSenha.text = "Gabriel222"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        self.validate()
        performSegue(withIdentifier: "screenHome", sender: self)
        
    }
    
    private func validate() {
        
        guard (self.textEmail.text != "")  else {
            self.alerta(title: "Aviso", mensagem: "Digite seu email ou CPF")
            return
        }
        
        guard (textEmail.text ?? "").isEmailValido() || (self.textEmail.text ?? "").isCPFValido else {
            self.alerta(title: "Aviso", mensagem: "Digite um email ou CPF valido!")
            return
        }
        
        let temp = (self.textSenha.text ?? "").isSenhaValida()
        guard temp.0 else {
            self.alerta(title: "Aviso", mensagem: temp.1)
            return
        }
    }
    
    @IBAction func unwindLogin(segue: UIStoryboardSegue) {}
    
}
