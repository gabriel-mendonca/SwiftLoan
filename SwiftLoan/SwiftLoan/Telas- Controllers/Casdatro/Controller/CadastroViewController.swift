//
//  CadastroViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 27/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {
    
    private let toolbarData = UIToolbar()
    private let dataPicker = UIDatePicker()

    @IBOutlet weak var textName: TextFieldSublinhada!
    @IBOutlet weak var textEmail: TextFieldSublinhada!
    @IBOutlet weak var textCPF: TextFieldSublinhada!
    @IBOutlet weak var textDate: TextFieldSublinhada!
    @IBOutlet weak var textPassword: TextFieldSublinhada!
    @IBOutlet weak var textConfirme: TextFieldSublinhada!
    @IBOutlet weak var scrollConteudo: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()

    }
 
    
    @objc func concluidoPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.textDate.text = formatter.string(from: self.dataPicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(){
        self.view.endEditing(true)
    }
    
    private func setupView() {
        self.toolbarData.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Concluído", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.concluidoPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelPicker))
        self.toolbarData.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        self.textDate.inputAccessoryView = toolbarData
        self.textDate.inputView = self.dataPicker
        self.dataPicker.datePickerMode = .date
        self.textCPF.delegate = self
        self.textCPF.TipoMascaraUsar = 2
        
    }
    
    @IBAction func btnProx(_ sender: UIButton) {

        self.validate()
        self.performSegue(withIdentifier: "screenAdress", sender: self)
    }
    
    private func validate() {
        
        guard (self.textName.text ?? "") != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite seu nome")
            return
        }
        
        guard (self.textName.text ?? "").contains(" ") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu nome completo")
            return
        }
        guard (self.textEmail.text ?? "") != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite seu email")
            return
        }
        
        guard (self.textEmail.text ?? "").isEmailValido() else {
            self.alerta(title: "Aviso", mensagem: "Digite um email valido!")
            return
        }
        
        guard (self.textCPF.text ?? "") != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite seu CPF")
            return
        }
        
        guard (self.textCPF.text ?? "").isCPFValido else {
            self.alerta(title: "Aviso", mensagem: "Digite um CPF valido")
            return
        }
        
        guard (textDate.text ?? "") != "" else {
            self.alerta(title: "Aviso", mensagem: "Selecione a data")
            return
        }
        
        guard (self.textPassword.text ?? "") != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite uma senha")
            return
        }
        
        let temp = (textPassword.text ?? "").isSenhaValida()
        guard temp.0 else {
            self.alerta(title: "Aviso", mensagem: temp.1)
            return
        }
        
        guard (textConfirme.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Confirme sua senha")
            return
        }
        
        guard (textPassword.text ?? "") == (textConfirme.text ?? "") else {
            self.alerta(title: "Aviso", mensagem: "Senha e confirmação precisão coincidir")
            return
        }
    }

    
    

}
