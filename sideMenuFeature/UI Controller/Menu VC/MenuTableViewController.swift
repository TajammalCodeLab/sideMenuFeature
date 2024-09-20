//
//  MenuTableViewController.swift
//  sideMenuFeature
//
//  Created by SID on 18/09/2024.
//

import UIKit
import Firebase
import SideMenu

class MenuTableViewController: UITableViewController {
    
    @IBOutlet var tableViewMenu: UITableView!
    
    var MenuDataArr = [MenuCellData]()
    weak var delegate: MenuSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataArr()
    }
    
    
    private func updateDataArr() {
        tableViewMenu.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: Identifiers.MENU_CELL_ID)
        MenuDataArr.append(MenuCellData(screenName: "Info", screenImage: "info.windshield"))
        MenuDataArr.append(MenuCellData(screenName: "Profile", screenImage: "person.circle"))
        MenuDataArr.append(MenuCellData(screenName: "Location", screenImage:"location.circle"))
        MenuDataArr.append(MenuCellData(screenName: "Log out", screenImage: "arrowshape.left.circle"))
    }
    
}

extension MenuTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuDataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMenu.dequeueReusableCell(withIdentifier: Identifiers.MENU_CELL_ID, for: indexPath) as! MenuTableViewCell
        cell.updateData(for: MenuDataArr[indexPath.row])
        return cell
    }
}

extension MenuTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row after selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch MenuDataArr[indexPath.row].screenName {
        case "Home":
            navigateToHome()
        case "Profile":
            navigateToProfile()
        case "Location":
            navigateToLocation()
        case "Log out":
            performLogout()
        default:
            break
        }
    }
    
    private func navigateToHome() {
        
    }
    
    private func navigateToProfile() {
        let vc = Storyboards.Dashboard.instantiateViewController(identifier: Identifiers.PROFILE_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func navigateToLocation() {
        let vc = Storyboards.Dashboard.instantiateViewController(identifier: Identifiers.LOCATION_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    private func resetToLoginScreen() {
//
//        
//        guard let loginVC = Storyboards.Auth.instantiateViewController(withIdentifier: Identifiers.LAUNCHSC_ID) as? EntryViewController else {
//            return
//        }
//        let navController = UINavigationController(rootViewController: loginVC)
//
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navController
//            window.makeKeyAndVisible()
//        }
//    }

    private func performLogout() {
        let alert = UIAlertController(title: "ACTION ALERT", message: "Nikal yahan sy", preferredStyle: .alert)
        let editAction = UIAlertAction(title: "YES", style: .default) { action in
            do {
                try Auth.auth().signOut()
                AuthService.UserDefaultsData.removeObject(forKey: "Email")
                AuthService.UserDefaultsData.removeObject(forKey: "Password")

                // Present the Auth storyboard
                if let loginVC = Storyboards.Auth.instantiateViewController(withIdentifier: Identifiers.LAUNCHSC_ID) as? EntryViewController {
                    let navController = UINavigationController(rootViewController: loginVC)
                    navController.modalPresentationStyle = .fullScreen
                    // Present the new navigation stack
                    self.view.window?.rootViewController = navController
                    self.view.window?.makeKeyAndVisible()
                }
                //self.resetToLoginScreen()

            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError.localizedDescription)
            }
        }

        let deleteAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        alert.addAction(editAction)
        alert.addAction(deleteAction)
        self.present(alert, animated: true, completion: nil)
    }
        
        
        
    }
