//
//  Data+Extension.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import Foundation
import UIKit
extension Date {
    func inString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
