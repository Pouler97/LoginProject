//
//  Person.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 13.02.2024.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
}
