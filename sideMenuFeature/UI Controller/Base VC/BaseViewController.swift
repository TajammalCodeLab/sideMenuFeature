//
//  BaseViewController.swift
//  sideMenuFeature
//
//  Created by SID on 02/09/2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    let main = Storyboards.Dashboard
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    //MARK: - Methods
    func updateTextField(parentView:CustomTextField, label: String, textField: UITextField, isPassword: Bool){
        /// Initialize CustomTextField with the outlet text field
        let customTextField = CustomTextField(labelName: label, textField: textField, isPassword: isPassword)
        
        parentView.addSubview(customTextField)
        /// Set constraints to ensure the custom text field fills the container
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        customTextField.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        customTextField.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        customTextField.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        customTextField.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
    }
    func popBack(){
        self.navigationController?.popViewController(animated: true)
    }
    func popToRootViewController(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
