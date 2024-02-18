//
//  UserButton.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 05.02.2024.
//

import UIKit

class UserButton: UIButton {
    
    init(text: String, state: UIControl.State) {
        super.init(frame: .zero)
        self.setTitle(text, for: state)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tintColor = .systemBlue
        setTitleColor(.systemBlue, for: .normal)
       titleShadowColor(for: .normal)
        titleLabel?.numberOfLines = 0
       translatesAutoresizingMaskIntoConstraints = false
    }
    
}
