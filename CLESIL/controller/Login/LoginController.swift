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
import FirebaseFirestore

class LoginController: UIViewController, GIDSignInUIDelegate{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true) // desaparece view controller
        view.backgroundColor = .white
        
        viewMain()
        actionImages()
        validateUserCurrent()
        
        Auth.auth().addStateDidChangeListener() { (auth, firebaseUser) in
            if firebaseUser != nil {
                self.validateUserCurrent()
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
        container.addSubview(separationLeft)
        container.addSubview(lbLogin)
         container.addSubview(separationRigth)
        container.addSubview(ivButtonLogin)
        container.addSubview(footerContainer)
        footerContainer.addSubview(lbTerm)
        container.addSubview(lbFooter)
        
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
    
    
    
    let footerContainer : UIView  = {
        let cont = UIView()
        cont.backgroundColor = .white
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    
    let lbFooter: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Upon entering you accept"
        lb.textColor = .white
        lb.font = lb.font.withSize(12)
        lb.textAlignment = .center
        return lb
    }()
    
    
    let lbTerm: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Terms & conditional"
        lb.textColor =  UIColor(red: 0/255, green:112/255, blue: 201/255, alpha: 1.0)
        lb.font = lb.font.withSize(12)
        lb.textAlignment = .center
        return lb
    }()
    
    
    let separationLeft : UIView  = {
        let sp = UIView()
        sp.layer.borderWidth = 1.0
        sp.layer.borderColor = UIColor.white.cgColor
        sp.backgroundColor = .white
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    let separationRigth : UIView  = {
        let sp = UIView()
        sp.layer.borderWidth = 1.0
        sp.layer.borderColor = UIColor.white.cgColor
        sp.backgroundColor = .white
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    
    
    
    
    
    
    
    
    
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
        
        separationLeft.centerYAnchor.constraint(equalTo: lbLogin.centerYAnchor).isActive = true
        separationLeft.leftAnchor.constraint(equalTo: container.leftAnchor,constant: 22).isActive = true
        separationLeft.rightAnchor.constraint(equalTo: lbLogin.leftAnchor,constant:-22).isActive = true
        separationLeft.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lbLogin.topAnchor.constraint(equalTo: lbSubTitle.bottomAnchor, constant: 33).isActive = true
        lbLogin.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        separationRigth.centerYAnchor.constraint(equalTo: lbLogin.centerYAnchor).isActive = true
        separationRigth.leftAnchor.constraint(equalTo: lbLogin.rightAnchor ,constant: 22).isActive = true
        separationRigth.rightAnchor.constraint(equalTo: container.rightAnchor ,constant:-22).isActive = true
        separationRigth.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        ivButtonLogin.heightAnchor.constraint(equalToConstant: 48).isActive = true
        ivButtonLogin.widthAnchor.constraint(equalToConstant: 48).isActive = true
        ivButtonLogin.topAnchor.constraint(equalTo: lbLogin.bottomAnchor, constant : 37).isActive = true
        ivButtonLogin.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        
        footerContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        footerContainer.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        footerContainer.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        footerContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lbTerm.centerYAnchor.constraint(equalTo: footerContainer.centerYAnchor).isActive = true
        lbTerm.leftAnchor.constraint(equalTo: footerContainer.leftAnchor).isActive = true
        lbTerm.rightAnchor.constraint(equalTo: footerContainer.rightAnchor).isActive = true
        
        lbFooter.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -65).isActive = true
        lbFooter.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        lbFooter.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
       
    }
    
    func validateUserCurrent(){
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            let name = user.displayName
            let uid = user.uid
            let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode)
            
            saveUsers(email: email!,name: name!,uid:uid,countryCode:countryCode as! String)
            
        }
    }
    
    func saveUsers(email:String,name:String,uid:String,countryCode:String){
        let db = Firestore.firestore()
        db.collection("users").document(uid).setData([
            "email": email,
            "name": name,
            "uid":uid,
            "countryCode":countryCode
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        goCategorys()
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
