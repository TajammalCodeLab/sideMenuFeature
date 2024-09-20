//
//  CustomTextField.swift
//  signInAndSignOut_feature
//
//  Created by SID on 20/08/2024.
//

import Foundation
import UIKit


class PaddedLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width + 20, height: super.intrinsicContentSize.height)
    }
}


class CustomTextField: UIView {
    
    private let label: UILabel
    private var textField: UITextField!
    private var isPassword: Bool
    
    init(labelName: String, textField: UITextField, isPassword: Bool) {
        
        
        self.isPassword = isPassword
        self.label = PaddedLabel()
        
        super.init(frame: .zero)
        self.textField = textField
        self.textField.borderStyle = .none
        self.textField.backgroundColor = .clear
        
        
        
        let containerView = UIView()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
    
        containerView.addSubview(self.textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: isPassword ? -35 : -10).isActive = true
        
        
        
     
        self.label.text = labelName
        self.label.font = UIFont.systemFont(ofSize: 14)
        self.label.textColor = .black
        self.label.backgroundColor = .white
        self.label.textAlignment = .center
        self.label.layer.zPosition = 1
        addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerYAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        self.label.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
}

