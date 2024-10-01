//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    private let helper = Helper()
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    private let hamsterImage = customImage(
        imageName: "hamster",
        cornerRadius: Constants.corner20,
        isShadowRequired: true)
    private let raccoonImage = customImage(
        imageName: "raccoon",
        cornerRadius: Constants.corner20,
        isShadowRequired: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        setupLabel()
        setupStackView()
        view.addSubview(textLabel)
        view.addSubview(stackView)
        setupLayout()
        setupView()
        
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...1000))
    }
}
    
// MARK: - Setup view
extension ViewController {
    private func setupView() {
        view.addGradient(
            colors:
                [UIColor.systemPink.cgColor,
                 UIColor.systemCyan.cgColor,
                 UIColor.systemPink.cgColor],
            startPoint: CGPoint(x: 0, y: 1),
            endPoint: CGPoint(x: 1, y: 0))
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .white
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.alignment = .center
        
        stackView.addArrangedSubview(raccoonImage)
        stackView.addArrangedSubview(hamsterImage)
    }
}
    
// MARK: - Setup Layout
extension ViewController {
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //настройка текста Лейбла
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //настройка стека
            stackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 600),
            stackView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}

// MARK: - Nested Types
extension ViewController {
    enum Images: String {
        case raccoon = "raccoon"
        case hamster = "hamster"
    }
    
    enum Constants {
        static let font30: CGFloat = 30
        static let corner20: CGFloat = 20
    }
}

