//
//  VerificationService.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 28.08.23.
//

import Foundation

class VerificationService {
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

