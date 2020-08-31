//
//  PerfilViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var informacao: [Dados] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

    }
    
    func setupTableView() {
        
        var dados: Dados
        dados = Dados(title: "Editar perfil", image: #imageLiteral(resourceName: "conversacao"))
        informacao.append(dados)
        
        dados = Dados(title: "Historico de solcitações", image: #imageLiteral(resourceName: "lista"))
        informacao.append(dados)
        
        dados = Dados(title: "Regulamento", image: #imageLiteral(resourceName: "lei"))
        informacao.append(dados)
        
        dados = Dados(title: "Sair", image: #imageLiteral(resourceName: "sair"))
        informacao.append(dados)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib (nibName: "PerfilTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informacao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dado: Dados = informacao[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerfilTableViewCell
        
        cell.imagem.image = dado.imagem
        cell.texto.text = dado.titulo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           performSegue(withIdentifier: "screenEdit", sender: self)
        case 1:
            performSegue(withIdentifier: "screenHistory", sender: self)
        case 2:
            performSegue(withIdentifier: "screenRegulamento", sender: self)
        default:
            performSegue(withIdentifier: "unwindLogin", sender: self)
        }
    }
    
    @IBAction func unwindPerfil(segue: UIStoryboardSegue)  {}


}
