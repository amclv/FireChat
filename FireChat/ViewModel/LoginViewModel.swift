//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Aaron Cleveland on 3/10/21.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
