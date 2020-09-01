//
//  HomeViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dado: [Dados] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()

    }

    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib (nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.isScrollEnabled = false
        
        var dados: Dados
        dados = Dados(title: "Solicitar empréstimo", image: #imageLiteral(resourceName: "emprestimo"))
        dado.append(dados)
        
        dados = Dados(title: "Depositar", image: #imageLiteral(resourceName: "dinheiro (1)"))
        dado.append(dados)
        
        dados = Dados(title: "Duvidas frequentes", image: #imageLiteral(resourceName: "perguntas-frequentes"))
        dado.append(dados)
        
        dados = Dados(title: "Acompanhar solicitação", image: #imageLiteral(resourceName: "clock"))
        dado.append(dados)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dado.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dados: Dados = dado[indexPath.row]
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        cell.image.image = dados.imagem
        cell.title.text = dados.titulo
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 2)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "screenEmprestimo", sender: self)
        case 1:
            performSegue(withIdentifier: "screenDeposit", sender: self)
        case 2:
            performSegue(withIdentifier: "screenDoubts", sender: self)
        case 3:
            performSegue(withIdentifier: "screenSideDish", sender: self)
        default:
            break
        }
    }
    
    
            @IBAction func unwindHome(segue: UIStoryboardSegue) {}
    

}
