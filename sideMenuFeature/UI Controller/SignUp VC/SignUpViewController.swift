//
//  SignUpViewController.swift
//  sideMenuFeature
//
//  Created by SID on 03/09/2024.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    // MARK: - IBoutLet -
    @IBOutlet weak var contentViewContainer: UIView!
    @IBOutlet weak var passwordView: CustomTextField!
    @IBOutlet weak var emailView: CustomTextField!
    @IBOutlet weak var confirmpasswordView: CustomTextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!{
        didSet{
            passwordTxtField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var confirmPasswordTxtfield: UITextField!{
        didSet{
            confirmPasswordTxtfield.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var signUpBtn: UIButton!{
        didSet{
            signUpBtn.layer.cornerRadius = 5
            signUpBtn.layer.shadowOpacity = 0.3
            signUpBtn.layer.shadowRadius = 5
        }
    }
    @IBOutlet weak var goBackTosignIn: UIButton!{
        didSet{
            goBackTosignIn.layer.cornerRadius = 5
            goBackTosignIn.layer.shadowOpacity = 0.1
            goBackTosignIn.layer.shadowRadius = 5
        }
    }
    
    
    
    
    
    //MARK: - life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreenUI()
        
    }
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    private func updateScreenUI(){
        CustomCardShadow.shadowadding(cardView: contentViewContainer)
        updateTextField(parentView: emailView, label: "Email", textField: emailTxtField, isPassword: false)
        updateTextField(parentView: passwordView, label: "Password", textField: passwordTxtField, isPassword: true)
        updateTextField(parentView: confirmpasswordView, label: "Confirm Password", textField: confirmPasswordTxtfield, isPassword: true)
        
    }
    
    
    
    @IBAction func backToSignInSC(_ sender: Any) {
        self.popToRootViewController()
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard !(emailTxtField.text?.isEmpty ?? true), !(passwordTxtField.text?.isEmpty ?? true) else {
            Utils.showAlert("Alert", "Email or password is empty", vc: self)
            return
        }
        if passwordTxtField.text == confirmPasswordTxtfield.text {
            AuthService.shared.signUp(email: emailTxtField.text ?? "", password: passwordTxtField.text ?? "", vc: self)
        }
        else {
            Utils.showAlert("Alert", "password not matched", vc: self)
        }
        
        
    }
    
    
}
