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
    let componentImageIconHeight: CGFloat = 25
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = .cyan
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "envelope")
        imageView.tintColor = .white
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: componentImageIconHeight),
            imageView.widthAnchor.constraint(equalToConstant: componentImageIconHeight)
        ])
        
        containerView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                                    constant: 8),
            emailTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                   constant: 2)
        ])
        
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = .yellow
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = .white
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: componentImageIconHeight),
            imageView.widthAnchor.constraint(equalToConstant: componentImageIconHeight)
        ])
        
        containerView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                                    constant: 8),
            passwordTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                   constant: 2)
        ])
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.textColor = .white
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.textColor = .white
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemTeal
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
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemTeal.cgColor]
        gradient.locations = [0.5, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

}
