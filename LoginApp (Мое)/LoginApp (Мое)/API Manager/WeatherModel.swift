//
//  WeatherModel.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 16.02.2024.
//

import Foundation

struct Weather: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
