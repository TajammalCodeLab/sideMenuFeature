//
//  CustomCardShadow.swift
//  sideMenuFeature
//
//  Created by SID on 03/09/2024.
//

import Foundation
import UIKit

struct CustomCardShadow{
    
    static func shadowadding(cardView: UIView) {
        cardView.layer.cornerRadius = 8
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        cardView.layer.shadowPath = UIBezierPath(roundedRect: cardView.bounds, cornerRadius: cardView.layer.cornerRadius).cgPath
    }
}
