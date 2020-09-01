//
//  Network.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 28/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import Foundation
import UIKit

class Api: NSObject {
    
    var enderecoRetornado = AdressModel()
    
    func getCep(cepBuscar: String, onSuccess:@escaping(Bool, String) -> Void) {
        var request = URLRequest(url: URL(string: "https://viacep.com.br/ws/\(cepBuscar)/json/")!)
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) {jsonRet,response,error in
            DispatchQueue.main.async {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode == 200 || httpResponse?.statusCode == 201 {
                    if let temp = try? JSONDecoder().decode(AdressModel.self, from: jsonRet!) {
                        self.enderecoRetornado = temp
                        onSuccess(true, "")
                    }else{
                        onSuccess(false, "Erro consultar dados")
                    }
                }else{
                    print("Erro request \(httpResponse?.statusCode ?? 0)")
                    onSuccess(false, "")
                }
            }
        }
        dataTask.resume()
    }
    
}
