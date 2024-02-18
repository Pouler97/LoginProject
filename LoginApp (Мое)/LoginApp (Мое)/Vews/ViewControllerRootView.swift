//
//  ViewControllerRootView.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 13.02.2024.
//

import UIKit

protocol ViewControllerRootViewActionsDelegate: AnyObject {
    
    func logInButtonPressed(login: String?, password: String?)
    func forgetNamePressed()
    func forgetPasswordPressed()
}

class ViewControllerRootView: UIView {
    
    weak var actionsDelegate: ViewControllerRootViewActionsDelegate?
    
    private let loginTextField = UserTextField(placeholder: "Login", secureText: false)
    private let passwordTextField = UserTextField(placeholder: "Password", secureText: true)
    
    private let logInButton = UserButton(text: "Log In", state: .normal)
    private let forgotNameButton = UserButton(text: "Forgot User Name?", state: .normal)
    private let forgotPasswordButton = UserButton(text: "Forgot password?", state: .normal)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGroupedBackground
        configureTextFields()
        configureButtons()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func logInButtonPressed() {
        actionsDelegate?.logInButtonPressed(login: loginTextField.text, password: passwordTextField.text)
    }
    
    @objc private func forgotNameTapped() {
        actionsDelegate?.forgetNamePressed()
    }
    
    @objc private func forgotPasswordTapped() {
        actionsDelegate?.forgetPasswordPressed()
    }
    
    private func configureTextFields() {
        
        addSubview(loginTextField)
        addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            loginTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    private func configureButtons() {
        
        addSubview(logInButton)
        addSubview(forgotNameButton)
        addSubview(forgotPasswordButton)
        
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        forgotNameButton.addTarget(self, action: #selector(forgotNameTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160.5),
            logInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160.5),
            logInButton.heightAnchor.constraint(equalToConstant: 20),
            logInButton.widthAnchor.constraint(equalToConstant: 10),
            
            forgotNameButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 40),
            forgotNameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            forgotNameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            forgotNameButton.heightAnchor.constraint(equalToConstant: 20),
            forgotNameButton.widthAnchor.constraint(equalToConstant: 5),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 40),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: forgotNameButton.trailingAnchor, constant: 40),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 5)
        ])
    }
    
}
