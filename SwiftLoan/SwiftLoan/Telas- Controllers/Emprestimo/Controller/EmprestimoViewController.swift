//
//  EmprestimoViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class EmprestimoViewController: UIViewController {
    
    private let toolbar = UIToolbar()
    private let pickerVencimento = UIPickerView()

    @IBOutlet weak var OneParcela: UITextField!
    @IBOutlet weak var textParcelas: UITextField!
    @IBOutlet weak var textValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.datePicker = createDatePicker(mode: .date)
        self.textValue.delegate = self
        self.textValue.TipoMascaraUsar = 3

    }
    
    private let listMes = (1...36).map(String.init)
    
    private var datePicker: UIDatePicker! {
           willSet(value) {
               self.OneParcela.inputView = value
           }
       }
    
    @objc func concluidoEmissor() {
        self.textParcelas.text = self.listMes[self.pickerVencimento.selectedRow(inComponent: 0)]
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(){
        self.view.endEditing(true)
    }
    
   private func setupView() {
        
        self.toolbar.sizeToFit()
           let doneButtonEstado = UIBarButtonItem(title: "Concluído", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.concluidoEmissor))
           let spaceButtonEstado = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButtonEstado = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelPicker))
           self.toolbar.setItems([cancelButtonEstado,spaceButtonEstado,doneButtonEstado], animated: false)
        
        self.textParcelas.inputAccessoryView = toolbar
        self.textParcelas.inputView = self.pickerVencimento
        self.pickerVencimento.delegate = self
        self.pickerVencimento.dataSource = self
    }
    
    private func createDatePicker(mode: UIDatePicker.Mode) -> UIDatePicker {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = mode
            datePicker.locale = Locale(identifier: "pt_BR")
            
            if mode == .date {
                datePicker.minimumDate = Date()
                datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: .valueChanged)
            }
            
            return datePicker
        }
        
        @objc func changeDate(datePicker: UIDatePicker) {
            let dateString = datePicker.date.inString(format: "dd/MM")
            
            
            if Calendar.current.isDateInToday(datePicker.date) {
            } else {
            }
            
            if OneParcela.inputView == datePicker && OneParcela.isFirstResponder {
                OneParcela.text = dateString
            }
            
        }
    
    @IBAction func btnEmprestimo(_ sender: UIButton) {
        
        self.validate()
        performSegue(withIdentifier: "screenAcompanhamento", sender: self)
        
    }
    
    private func validate() {
        
        guard (textValue.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite o valor de empréstimo!")
            return
        }
        
        guard (OneParcela.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Selecione a data da primeira parcela")
            return
        }
        
        guard (textParcelas.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Selcione a parcela desejada")
            return
        }
        
    }
    
}

extension EmprestimoViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.listMes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.listMes[row]
    }
    
    


}

