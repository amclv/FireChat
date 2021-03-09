//
//  LoginViewController.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/8/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let iconImageHeight: CGFloat = 120
    let standardPadding: CGFloat = 20
    let componentHeight: CGFloat = 50
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private let emailContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    private let passwordContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemPink
        return button
    }()
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
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
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: standardPadding),
            iconImage.heightAnchor.constraint(equalToConstant: iconImageHeight),
            iconImage.widthAnchor.constraint(equalToConstant: iconImageHeight)
        ])
        
        vStack.addArrangedSubview(emailContainerView)
        vStack.addArrangedSubview(passwordContainerView)
        vStack.addArrangedSubview(loginButton)
        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            emailContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            passwordContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            loginButton.heightAnchor.constraint(equalToConstant: componentHeight),

            vStack.topAnchor.constraint(equalTo: iconImage.bottomAnchor,
                                        constant: standardPadding),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: standardPadding),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -standardPadding)
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
