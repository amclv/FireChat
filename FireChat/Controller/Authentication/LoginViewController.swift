//
//  LoginViewController.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/8/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let iconImageHeight: CGFloat = 120
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .white
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions -
    private func configureUI() {
        configureGradientLayer()
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: iconImageHeight),
            iconImage.widthAnchor.constraint(equalToConstant: iconImageHeight)
        ])
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemIndigo.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

}
