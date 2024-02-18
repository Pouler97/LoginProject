//
//  ViewController.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 05.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    var rootView: ViewControllerRootView! {
        self.view as! ViewControllerRootView
    }
    
    private var pulseButton = UserButton(text: "Pulse", state: .normal)
    
    var user = User.gitUserInfo()
    
    override func loadView() {
        let rootView = ViewControllerRootView()
        rootView.actionsDelegate = self
        self.view = rootView
        
        view.addSubview(pulseButton)
        pulseButton.translatesAutoresizingMaskIntoConstraints = false
        pulseButton.pulsate()
        configureButton()
    }
    
    private func configureButton() {
     
        NSLayoutConstraint.activate([
        
            pulseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pulseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180)
            
        ])
        
    }
}

extension LoginViewController: ViewControllerRootViewActionsDelegate {
    func logInButtonPressed(login: String?, password: String?) {
        if login == user.login, password == user.password {
            present(WelcomeViewController(), animated: true)
        } else {
            showAlert(title: "Oooops", message: "You write wrong login or password", textField: "")
        }
    }
    
    func forgetNamePressed() {
        showAlert(title: "Oh no!", message: "Wrong login", textField: "")
    }
    
    func forgetPasswordPressed() {
        showAlert(title: "Oh no!", message: "Wrong password", textField: "")
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
