//
//  ObjetivoEmprestimoViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class ObjetivoEmprestimoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
   private var objetivo: [Dados] = []
   private let idCell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

    }
    
   private func setupTableView() {
        
        var dado: Dados
        dado = Dados(title: "contas da casa", image: #imageLiteral(resourceName: "conta"))
        objetivo.append(dado)
        
        dado = Dados(title: "Reforma ou consertos", image: #imageLiteral(resourceName: "casa") )
        objetivo.append(dado)
        
        dado = Dados(title: "Investir no meu negócio", image: #imageLiteral(resourceName: "carrinho"))
        objetivo.append(dado)
        
        dado = Dados(title: "Viagem", image: #imageLiteral(resourceName: "viagem"))
        objetivo.append(dado)
        
        dado = Dados(title: "Divida", image: #imageLiteral(resourceName: "dinheiro (1)"))
        objetivo.append(dado)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib (nibName: "ObjetivoEmprestimoTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objetivo.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dados: Dados = objetivo[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! ObjetivoEmprestimoTableViewCell
        
        cell.imagem.image = dados.imagem
        cell.titulo.text = dados.titulo
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "screenLoan", sender: self)
    }


}
