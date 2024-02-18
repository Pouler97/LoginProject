//
//  WelcomeViewController.swift
//  LoginApp (Мое)
//
//  Created by Павел Ершов on 09.02.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var welcomeLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Hello, \(User.gitUserInfo().person.fullname)"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {
       let label = UILabel()
        
        label.text = "28"
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
       let label = UILabel()
        
        label.text = "London"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    
    private let primaryColor = UIColor(red: 210/255,
                                       green: 109/255,
                                       blue: 128/255,
                                       alpha: 1)
    
    private let secondaryColor = UIColor(red: 107/255,
                                         green: 148/255,
                                         blue: 230/255,
                                         alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(primaryColor: primaryColor, secondaryColor: secondaryColor)
        configureUILabel()
        configureWeatherLabels()
    }
    
    private func configureWeatherLabels() {
        
        view.addSubview(weatherLabel)
        view.addSubview(cityLabel)
        
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.global().async {
            
            ApiManager().loadData() { [weak self] weather in
                guard let weather else { return }
                
                DispatchQueue.main.async {
                    
                    self?.weatherLabel.text = "\(weather.main.temp)"
                    
                }
            }
        }
        
        
        NSLayoutConstraint.activate([
        
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: weatherLabel.topAnchor, constant: -16)
        
        ])
        
    }
    
    private func configureUILabel() {
        
        view.addSubview(welcomeLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

extension WelcomeViewController {
    func addVerticalGradientLayer(primaryColor: UIColor, secondaryColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
