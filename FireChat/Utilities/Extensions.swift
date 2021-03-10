//
//  Extensions.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/9/21.
//

import Foundation
import UIKit

extension UIViewController {
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemTeal.cgColor]
        gradient.locations = [0.5, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
