//
//  SolicitarEmprestimoViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class SolicitarEmprestimoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let idCell = "cell"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
   private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib (nibName: "SolicitarEmprestimoTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! SolicitarEmprestimoTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let temp = UIView()
        temp.alpha = 0
        return temp
    }
    


}
