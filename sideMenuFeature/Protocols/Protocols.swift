//
//  Protocols.swift
//  signInAndSignOut_feature
//
//  Created by SID on 22/08/2024.
//

import Foundation
import UIKit
protocol DataSendingProtocol {
    func sendDataToDashboard(userName: String, password: String)
}

protocol PackagesDelegates {
    func didEdit(for indexpath:IndexPath?)
    func didDelete(for indexpath:IndexPath?)
    func didShowAlert(for indexPath: IndexPath?)
    func didImagePicker(imagePackage: UIImageView)
}


protocol bindingDataDelegate {
    func didSetDelegates(_ delegate: PackagesDelegates, with indexpath:IndexPath?)
}


protocol MenuSelectionDelegate: AnyObject {
    func didTapMenuOption(_ menuItem: MenuCellData)
}
