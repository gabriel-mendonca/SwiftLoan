//
//  DuvidasFrequentesViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class DuvidasFrequentesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
    let perguntas = [["1.Como posso solicitar o empréstimo?"],
    ["2.Quem pode fazer empréstimo?"],
    ["3.Preciso comprovar renda?"],
    ["4.Preciso ter algum dispositivo?"],
    ["5.Qual o prazo de aprovação?"]]
    let descricao = [["Você pode solicitar o empréstimo através do App ou pela Web no site www.swiftloan.com.br."],
    ["Pessoas fisicas e juridicas."],
    ["Sim. Para a realização do Empréstimo pessoal é necessário a comprovação de renda."],
    ["Se você quiser fazer empréstimo pelo Web ou pelo App você precisará ter em mãos um celular ou um computador."],
    ["Faremos uma análise da sua proposta em 24 horas.(Exceto: sábado,domingo e feriado)."]]
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib (nibName: "DuvidasFrequentesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DuvidasFrequentesTableViewCell
        let dadoTemp = perguntas[indexPath.section]
            cell.labelPergunta.text = dadoTemp[0]
        let dadosTemp = descricao[indexPath.section]
        cell.labelDescription.text = dadosTemp[0]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    


}
