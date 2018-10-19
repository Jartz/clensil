//
//  LoginController.swift
//  CLESIL
//
//  Created by JULIAN RAMOS on 10/18/18.
//  Copyright © 2018 Elitedsh S.A.S. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginController: UIViewController, GIDSignInUIDelegate{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true) // desaparece view controller
        view.backgroundColor = .white
        
        viewMain()
        actionImages()
        validateUserCurrent()
        
        Auth.auth().addStateDidChangeListener() { (auth, firebaseUser) in
            if let firebaseUser = firebaseUser {
                self.goCategorys()
            } else {
                print("not logged int")
            }
        }
        
          /*
         let blurEffect = UIBlurEffect(style: .light)
         let blurView = UIVisualEffectView(effect:blurEffect)
         blurView.frame = background_image.bounds
         background_image.addSubview(blurView)
         */
        
    }
    
    // ======== VISTAS ==========
    func viewMain(){
        view.addSubview(background_image)
        view.addSubview(container)
        container.addSubview(btnCategorys)
        container.addSubview(lbTitle)
        container.addSubview(lbSubTitle)
        container.addSubview(lbLogin)
        container.addSubview(ivButtonLogin)
        setupConstraint()
    }
    
    func actionImages(){
     ivButtonLogin.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singGoogle)))
    }
    
    // ======== CONFIG ==========
    
    let container: UIView = {
        let cont = UIView()
        cont.translatesAutoresizingMaskIntoConstraints = false
        //cont.backgroundColor = .yellow
        return cont
    }()
    
    
    var background_image : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bg_login")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = false
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let lbTitle : UILabel = {
        let lb = UILabel()
        lb.text = "Clesil"
        lb.textColor = .white
        //lb.backgroundColor = .blue
        lb.font = lb.font.withSize(40)
        lb.textAlignment = .center
        lb.attributedText = NSAttributedString(string: "CLESIL",attributes:[ kCTKernAttributeName as NSAttributedString.Key: 12])
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let lbSubTitle : UILabel = {
        let lb = UILabel()
        lb.text = "CLEAR SERVICE INTERNATIONAL"
        lb.textColor = .white
        // lb.backgroundColor = .blue
        lb.font = lb.font.withSize(20)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let lbLogin : UILabel = {
        let lb = UILabel()
        lb.text = "Login with"
        lb.textColor = .white
        // lb.backgroundColor = .blue
        lb.font = lb.font.withSize(12)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let ivButtonLogin : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "google2")
        iv.contentMode = .scaleToFill
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var btnCategorys : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("go to categorys", for: .normal)
        btn.addTarget(self, action: #selector(goCategorys), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
   
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
    
    
    
    
    // ======== POSITION ==========
    
    func setupConstraint(){
        
        background_image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background_image.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        background_image.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        background_image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 121).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        btnCategorys.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        btnCategorys.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        btnCategorys.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        
        lbTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        lbTitle.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        lbTitle.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        lbSubTitle.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 22).isActive = true
        lbSubTitle.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        lbSubTitle.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        lbLogin.topAnchor.constraint(equalTo: lbSubTitle.bottomAnchor, constant: 33).isActive = true
        lbLogin.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        lbLogin.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        ivButtonLogin.heightAnchor.constraint(equalToConstant: 48).isActive = true
        ivButtonLogin.widthAnchor.constraint(equalToConstant: 48).isActive = true
        ivButtonLogin.topAnchor.constraint(equalTo: lbLogin.bottomAnchor, constant : 37).isActive = true
        ivButtonLogin.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
       
    }
    
    func validateUserCurrent(){
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            print(email as! String)
            goCategorys()
        }
    }
    
    
    @objc func goCategorys(){
        print("Direccionando a panel")
        let categorysController  = CategorysController()
        let navigationController = UINavigationController(rootViewController:categorysController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
 
    
    @objc func singGoogle(sender: UITapGestureRecognizer){
        print("Tap Gesture recognized")
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
}
