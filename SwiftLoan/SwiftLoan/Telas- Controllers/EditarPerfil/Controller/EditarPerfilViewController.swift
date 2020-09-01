//
//  EditarPerfilViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 30/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class EditarPerfilViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var imagePicker = UIImagePickerController()

    @IBOutlet weak var textFone: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var btnImagePerfil: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textName.text = "Gabriel Mendonça Sousa Gonçalves"
        textFone.text = "(34)98417-2997"
        self.textFone.delegate = self
        self.textFone.TipoMascaraUsar = 1
        
    }
    
    @IBAction func alteraFoto(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Seleciona Imagem", message: nil, preferredStyle: .actionSheet)
             alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                 self.openCamera()
             }))

             alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { _ in
                 self.openGallary()
             }))

             alert.addAction(UIAlertAction.init(title: "Cancelar", style: .cancel, handler: nil))

             switch UIDevice.current.userInterfaceIdiom {
             case .pad:
                 alert.popoverPresentationController?.sourceView = sender
                 alert.popoverPresentationController?.sourceRect = sender.bounds
                 alert.popoverPresentationController?.permittedArrowDirections = .up
             default:
                 break
             }

             self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,image: UIImage!, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { fatalError("Expected a dictionary containing an image, but was provided the following: \(info)") }
        let fotoConvertida =  resizeImage(image: selectedImage, newWidth: 350)
        self.btnImagePerfil.setImage((fotoConvertida ?? UIImage()), for: .normal)
        dismiss(animated: true, completion: nil)
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage! {
         let scale = newWidth / image.size.width
         let newHeight = image.size.height * scale
         UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
         image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
         
         let newImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
        
         
         return newImage
     }

    
    private func openCamera(){
          imagePicker =  UIImagePickerController()
          imagePicker.delegate = self
          imagePicker.sourceType = .camera
          present(imagePicker, animated: true, completion: nil)
      }

    private func openGallary(){
          
          if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
              imagePicker.delegate = self
              imagePicker.sourceType = .savedPhotosAlbum;
              imagePicker.allowsEditing = false
              
              self.present(imagePicker, animated: true, completion: nil)
          }
      }
    
    @IBAction func btnConcluir(_ sender: UIButton) {
        
        self.validate()
        
    }
    
    private func validate() {
        
        guard (textName.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu nome")
            return
        }
        
        guard (textFone.text != "") else {
            self.alerta(title: "Aviso", mensagem: "Digite seu numero de telefone")
            return
        }
        
        let alert = UIAlertController(title: "Sucesso!", message: "Seus dados foi atualizado com sucesso", preferredStyle: .alert)
        
        alert.addAction(.init(title: "OK", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "unwindPerfil", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

}
