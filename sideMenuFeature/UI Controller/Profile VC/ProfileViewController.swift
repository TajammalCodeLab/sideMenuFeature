//
//  ProfileViewController.swift
//  sideMenuFeature
//
//  Created by SID on 19/09/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var showPasswordLabel: UIButton!
    @IBOutlet weak var passwordlabel: UILabel!
    var isPasswordVisible = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatedLabels()
        
        
    }
    func updatedLabels(){
        emaillabel.text = AuthService.UserDefaultsData.string(forKey: "Email")
        let password = AuthService.UserDefaultsData.string(forKey: "Password") ?? ""
        passwordlabel.text = String(repeating: "*", count: password.count)
    }
    
    
    @IBAction func showPassword(_ sender: UIButton) {
        isPasswordVisible.toggle()
        
        // Fetch the password from UserDefaults
        let password = AuthService.UserDefaultsData.string(forKey: "Password") ?? ""
        
        if isPasswordVisible {
            // Show the actual password
            passwordlabel.text = password
            showPasswordLabel.setTitle("Hide password", for: .normal)
        } else {
            // Mask the password
            passwordlabel.text = String(repeating: "*", count: password.count)
            showPasswordLabel.setTitle("Show password", for: .normal)
        }
    }
    
}
