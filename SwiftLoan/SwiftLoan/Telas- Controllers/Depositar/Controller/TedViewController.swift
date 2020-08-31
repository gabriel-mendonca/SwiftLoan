//
//  TedViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class TedViewController: UIViewController {
    
    @IBOutlet weak var btnCompartilhar: UIButton!
    @IBOutlet weak var btnFechar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCompartilhar.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func btnTapped() {
        let actVC = UIActivityViewController(activityItems: ["funcionalidade compartilhar OK"], applicationActivities: nil)
        self.present(actVC, animated: true, completion: nil)
    }
    
    
}
