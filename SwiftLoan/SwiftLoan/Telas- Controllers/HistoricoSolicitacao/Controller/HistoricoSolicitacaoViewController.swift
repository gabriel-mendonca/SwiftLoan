//
//  HistoricoSolicitacaoViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class HistoricoSolicitacaoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    private var dadosCell: [InformacaoHistorico] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
   private func setupTableView() {
        
        var dados: InformacaoHistorico
        dados = InformacaoHistorico(title: "Aprovado", image: #imageLiteral(resourceName: "lista (1)"), value: "R$:20.000,00")
        dadosCell.append(dados)
        
        dados = InformacaoHistorico(title: "Aprovado", image: #imageLiteral(resourceName: "lista (1)"), value: "R$:500,00")
        dadosCell.append(dados)
        
        dados = InformacaoHistorico(title: "Reprovado", image: #imageLiteral(resourceName: "proibido"), value: "R$:100.000,00")
        dadosCell.append(dados)
        
        dados = InformacaoHistorico(title: "Reprovado", image: #imageLiteral(resourceName: "proibido"), value: "R$:10.000,00")
        dadosCell.append(dados)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib (nibName: "HistoricoSolicitacaoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dado: InformacaoHistorico = dadosCell[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoricoSolicitacaoTableViewCell
        
        cell.imagem.image = dado.imagem
        cell.status.text = dado.titulo
        cell.valor.text = dado.valor
        cell.topView.clipsToBounds = true
        cell.topView.layer.cornerRadius = cell.topView.frame.width/2
        cell.bottomView.clipsToBounds = true
        cell.bottomView.layer.cornerRadius = cell.bottomView.frame.width/2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    


}
