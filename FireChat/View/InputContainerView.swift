//
//  InputContainerView.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/9/21.
//
/*
 DRY NOTES
 This is so that the login and register view controllers don't use duplicate code.
 */

import UIKit

class InputContainerView: UIView {
    
    let standardPadding: CGFloat = 8
    let inputContainerImageHeight: CGFloat = 30
    
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.tintColor = .white
        imageView.alpha = 0.87
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: standardPadding),
            imageView.heightAnchor.constraint(equalToConstant: inputContainerImageHeight),
            imageView.widthAnchor.constraint(equalToConstant: inputContainerImageHeight)
        ])
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                               constant: standardPadding),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: 2)
        ])
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                 constant: standardPadding),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.75)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
