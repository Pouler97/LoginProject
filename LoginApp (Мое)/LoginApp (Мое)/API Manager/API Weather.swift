//
//  API Weather.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 16.02.2024.
//

import Foundation

final class ApiManager {
    
    private let apiKey = "91d503e7329ca54eaa38dd0b34de98c4"
    
    func loadData(completion: @escaping (Weather?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=\(apiKey)") else {return}
        
        let session = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            guard let data = data else {return}
            
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            
            completion(weather)
        }
        
        session.resume()
    }
}
