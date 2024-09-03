//
//  LoginViewController.swift
//  sideMenuFeature
//
//  Created by SID on 02/09/2024.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passwordView: CustomTextField!
    @IBOutlet weak var emailView: CustomTextField!
    
    @IBOutlet weak var loginBtn: UIButton!{
        didSet{
            loginBtn.layer.cornerRadius = 5
            loginBtn.layer.shadowOpacity = 0.3
            loginBtn.layer.shadowRadius = 5
        }
    }
    @IBOutlet weak var signUpBtn: UIButton!{
        didSet{
            signUpBtn.layer.cornerRadius = 5
            signUpBtn.layer.shadowOpacity = 0.1
            signUpBtn.layer.shadowRadius = 5
        }
    }
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!{
        didSet{
            passwordTxtField.isSecureTextEntry = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func updateUI(){
        self.updateTextField(parentView: emailView, label: "Email", textField: emailTxtField, isPassword: false)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTxtField, isPassword: true)
        CustomCardShadow.shadowadding(cardView: contentView)
    }
    
    
    @IBAction func logInBtn(_ sender: UIButton) {
        guard !(emailTxtField.text?.isEmpty ?? true), !(passwordTxtField.text?.isEmpty ?? true) else {
            Utils.showAlert("Alert", "Email or password is empty", vc: self)
            return
        }
        
        AuthService.shared.signIn(email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", vc: self)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        Utils.showAlert("Alter", "COMMING SOON", vc: self)
    }
    
}

