//
//  Page3ViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class Page3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("alteraInteresse"), object: Page3ViewController.self)
    }

}
