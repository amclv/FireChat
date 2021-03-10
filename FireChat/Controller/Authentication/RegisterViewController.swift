//
//  RegisterViewController.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/8/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let addPhotoImageHeight: CGFloat = 120
    let standardPadding: CGFloat = 20
    let componentHeight: CGFloat = 50
    
    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        // Directly aligns content in the middle of the button
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        // adds a small edge case for a little bit of padding around the button.
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handlePhotoSelection), for: .touchUpInside)
        return button
    }()
    
    // UIViews
    private lazy var emailContainerView = InputContainerView(image: UIImage(systemName: "envelope"),
                                                             textField: emailTextField)
    
    private lazy var passwordContainerView = InputContainerView(image: UIImage(systemName: "lock"),
                                                                textField: passwordTextField)
    
    private lazy var fullNameContainerView = InputContainerView(image: UIImage(systemName: "person"),
                                                                textField: fullnameTextField)
    
    private lazy var usernameContainerView = InputContainerView(image: UIImage(systemName: "person"),
                                                                textField: usernameTextField)
    
    // TextFields
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullnameTextField = CustomTextField(placeholder: "Full Name")
    private let usernameTextField = CustomTextField(placeholder: "Username")
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
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
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Log In",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()

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
                                           constant: standardPadding),
            addPhotoButton.heightAnchor.constraint(equalToConstant: addPhotoImageHeight),
            addPhotoButton.widthAnchor.constraint(equalToConstant: addPhotoImageHeight)
        ])
        
        vStack.addArrangedSubview(emailContainerView)
        vStack.addArrangedSubview(fullNameContainerView)
        vStack.addArrangedSubview(usernameContainerView)
        vStack.addArrangedSubview(passwordContainerView)
        vStack.addArrangedSubview(signupButton)
        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            emailContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            fullNameContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            usernameContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            passwordContainerView.heightAnchor.constraint(equalToConstant: componentHeight),
            signupButton.heightAnchor.constraint(equalToConstant: componentHeight),

            vStack.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor,
                                        constant: standardPadding),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: standardPadding),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -standardPadding)
        ])

        view.addSubview(alreadyHaveAccountButton)
        NSLayoutConstraint.activate([
            alreadyHaveAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                           constant: standardPadding),
            alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                          constant: -standardPadding),
            alreadyHaveAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                            constant: -standardPadding)
        ])
    }
    
    @objc func handlePhotoSelection() {
        
    }
    
    @objc func handleShowLogin() {
        // Takes us back to the previous screen
        navigationController?.popViewController(animated: true)
    }
}
