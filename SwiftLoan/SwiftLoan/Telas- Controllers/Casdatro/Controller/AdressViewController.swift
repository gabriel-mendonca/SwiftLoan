//
//  AdressViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 28/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit
import InputMask

class AdressViewController: UIViewController {

    @IBOutlet weak var scrollConteudo: UIScrollView!
    @IBOutlet weak var textCep: TextFieldSublinhada!
    @IBOutlet weak var textPais: TextFieldSublinhada!
    @IBOutlet weak var textEstado: TextFieldSublinhada!
    @IBOutlet weak var textCidade: TextFieldSublinhada!
    @IBOutlet weak var textBairro: TextFieldSublinhada!
    @IBOutlet weak var textRua: TextFieldSublinhada!
    @IBOutlet weak var textComplemento: TextFieldSublinhada!
    @IBOutlet weak var textNumber: TextFieldSublinhada!
    @IBOutlet weak var activityCarregando: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func MudaText(_ sender: TextFieldSublinhada) {
        if sender.text?.count == 8 {
            self.carregando()
            apiUsar.getCep(cepBuscar: (sender.text ?? "")) { (ret, msg) in
                self.carregou()
                if ret {
                    self.populaDados()
                } else {
                    self.alerta(title: "Aviso", mensagem: "Não conseguimos consultar seu cep, por favor preencha os dados manualmente.")
                }
            }
        }
    }
    
    func carregando() {
        self.activityCarregando.alpha = 1
        self.activityCarregando.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    func carregou()  {
        self.activityCarregando.alpha = 0
        self.activityCarregando.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    func populaDados() {
        self.textPais.text = "Brasil"
        self.textEstado.text = apiUsar.enderecoRetornado.uf ?? ""
        self.textCidade.text = apiUsar.enderecoRetornado.localidade ?? ""
        self.textBairro.text = apiUsar.enderecoRetornado.bairro ?? ""
        self.textRua.text = apiUsar.enderecoRetornado.logradouro ?? ""
        
        
    }
    
    @IBAction func concluirCadastro(_ sender: UIButton) {
        
        self.validate()
        self.performSegue(withIdentifier: "ScreenLogin", sender: self)

    }
    
    func validate() {
        
        guard (self.textCep.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu cep")
            return
        }
        
        guard (self.textPais.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu país")
            return
        }
        
        guard (self.textCidade.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite sua cidade")
            return
        }
        
        guard (self.textEstado.text != "") else {
            self.alerta(title: "Alerta", mensagem: "Digite seu estado")
            return
        }
        
        guard (self.textBairro.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu bairro")
            return
        }
        
        guard (self.textRua.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite sua rua")
            return
        }
        
        guard (self.textNumber.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu número")
            return
        }
        
    }
    
    

}
