//
//  EntryViewController.swift
//  sideMenuFeature
//
//  Created by SID on 02/09/2024.
//

import UIKit
import FirebaseAuth

class EntryViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        directTowardsLogin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    private func directTowardsLogin() {
        loadingIndicator.startAnimating()
        
        if let currentUser = Auth.auth().currentUser {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loadingIndicator.stopAnimating()
                let dashboardVC = Storyboards.Dashboard.instantiateViewController(identifier: Identifiers.DASHBOARD_ID)
                self.navigationController?.pushViewController(dashboardVC, animated: true)
            }
        } else {
            // User is not signed in, navigate to the Login screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loadingIndicator.stopAnimating()
                let loginVC = Storyboards.Auth.instantiateViewController(identifier: Identifiers.LOGIN_ID)
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
}
