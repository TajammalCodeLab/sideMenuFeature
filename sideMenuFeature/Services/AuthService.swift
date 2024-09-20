//
//  AuthService.swift
//  sideMenuFeature
//
//  Created by SID on 03/09/2024.
//

import Foundation
import FirebaseAuth
import UIKit

class AuthService {
    static let shared = AuthService()
    static let UserDefaultsData = UserDefaults.standard
    
    func signIn(email: String, password: String, vc: UIViewController) {
        
        if Utils.isValidEmail(email) && Utils.isValidPassword(password){
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard let error = error else {
                    AuthService.UserDefaultsData.set(email, forKey: "Email")
                    AuthService.UserDefaultsData.set(password, forKey: "Password")
                    let vcon = Storyboards.Dashboard.instantiateViewController(identifier: Identifiers.DASHBOARD_ID)
                    vc.navigationController?.pushViewController(vcon, animated: true)
                    
                    return
                }
                Utils.showAlert("OOoooopps", "Something went wrong during sign In \(error.localizedDescription)", vc: vc)
            }
        } else {
            Utils.showAlert("Alert", "Email or Password Invalid", vc: vc)
        }
    }
}

