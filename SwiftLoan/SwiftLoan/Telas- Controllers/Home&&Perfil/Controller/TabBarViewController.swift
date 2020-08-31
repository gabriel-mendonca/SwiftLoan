//
//  TabBarViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(_ animated: Bool) {
              self.navigationController?.navigationBar.isHidden = true
          }
          
          override func viewWillDisappear(_ animated: Bool) {
              self.navigationController?.navigationBar.isHidden = false
          }

}
