//
//  AcompanhamentoViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class AcompanhamentoViewController: UIViewController {

    @IBOutlet weak var progressAnalise: UIProgressView!
    @IBOutlet weak var progressProcessando: UIProgressView!
    
    @IBOutlet weak var viewProcessando: UIView!
    @IBOutlet weak var viewAnalise: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        triggerProgressView()
        
    }
    
   private func triggerProgressView() {

           progressProcessando.progress = 1.0
           
           UIView.animate(withDuration: 3.9 , delay: 0.0, options: [.curveEaseInOut,.beginFromCurrentState, .preferredFramesPerSecond60], animations:{
               
               self.progressProcessando.layoutIfNeeded()
               
           }, completion: {(_) in

               self.viewProcessando.alpha = 0
               self.viewAnalise.alpha = 1
               
               })
       }
}
