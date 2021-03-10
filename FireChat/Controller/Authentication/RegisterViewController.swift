//
//  RegisterViewController.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/8/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let addPhotoImageHeight: CGFloat = 120
    
    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handlePhotoSelection), for: .touchUpInside)
        return button
    }()
    
    // UIViews
    private lazy var emailContainerView = InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
    
    private lazy var passwordContainerView = InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
    
    private lazy var fullNameContainerView = InputContainerView(image: UIImage(systemName: "person"), textField: fullNameTextField)
    
    private lazy var usernameContainerView = InputContainerView(image: UIImage(systemName: "person"), textField: usernameTextField)
    
    // TextFields
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullnameTextField = CustomTextField(placeholder: "Full Name")
    private let usernameTextField = CustomTextField(placeholder: "Username")

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers -
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: 20),
            addPhotoButton.heightAnchor.constraint(equalToConstant: addPhotoImageHeight),
            addPhotoButton.widthAnchor.constraint(equalToConstant: addPhotoImageHeight)
        ])
    }
    
    @objc func handlePhotoSelection() {
        
    }
}
