//
//  PanelController.swift
//  CLESIL
//
//  Created by JULIAN RAMOS on 10/18/18.
//  Copyright © 2018 Elitedsh S.A.S. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class CategorysController:UIViewController{
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        self.title = "some title"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SingOut", style: .plain, target: self, action: #selector(singOut))
    }
    
    /*
     let tvMail : UITextField = {
     let tv = UITextField()
     tv.text = ""
     tv.placeholder = "Correo Electronico"
     tv.leftView = UIImageView(image: UIImage(named: "usuario"))
     tv.leftViewMode = .always
     tv.borderStyle = UITextBorderStyle.roundedRect
     tv.autocorrectionType = UITextAutocorrectionType.no
     tv.keyboardType = UIKeyboardType.default
     tv.returnKeyType = UIReturnKeyType.done
     tv.clearButtonMode = UITextFieldViewMode.whileEditing;
     tv.translatesAutoresizingMaskIntoConstraints = false
     return tv
     }()
     */
    
    
    @objc func back(){
        print("back")
    }
    
    @objc func singOut(){
        print("salir")
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.dismiss(animated: false, completion:nil);
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    
}
