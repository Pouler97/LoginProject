//
//  LoginTextField.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 05.02.2024.
//

import UIKit

class UserTextField: UITextField {
    
    init(placeholder: String?, secureText: Bool?) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = secureText ?? false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        tintColor = .black
        backgroundColor = .white
        font = .systemFont(ofSize: 14)
        sizingRule = .typographic
        translatesAutoresizingMaskIntoConstraints = false
    }
}
