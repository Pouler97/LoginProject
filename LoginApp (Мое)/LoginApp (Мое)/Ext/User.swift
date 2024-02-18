//
//  User.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 05.02.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func gitUserInfo() -> User {
        User(login: "Login",
             password: "Password",
             person: Person(name: "Pavel", surname: "Ershov"))
    }
}
