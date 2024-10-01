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
    private let numberButton = CustomButton(
        buttonSelfColor: UIColor.systemRed,
        buttonTextColor: UIColor.black,
        buttonText: "Change number!",
        isShadowRequired: true)
    private let imageButton = CustomButton(
        buttonSelfColor: UIColor.systemGreen,
        buttonTextColor: UIColor.black,
        buttonText: "Change image!",
        isShadowRequired: true)
    private let mainImage = CustomImage(
        imageName: Images.raccoon.rawValue,
        cornerRadius: Constants.corner20,
        isShadowRequired: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        setupLabel()
        setupStackView()
        view.addSubview(textLabel)
        view.addSubview(stackView)
        addAction()
        setupView()
        
        setupLayout()
    }
    
    private func updateNumbers() {
        for number in 0...1000 {
            helper.addNumber(number)
        }
    }
    
    @objc
    private func numberButtonTapped() {
        textLabel.text = helper.getRandomNumber().formatted()
    }
}


    
// MARK: - Setup view
extension ViewController {
    func addAction() {
        numberButton.addTarget(
            self,
            action: #selector(numberButtonTapped),
            for: .touchUpInside)
        
        let action = UIAction { _ in
            let randomImageName = [
                Images.raccoon.rawValue,
                Images.hamster.rawValue,
            ].randomElement() ?? Images.raccoon.rawValue
            
            self.mainImage.updateImage(randomImageName)
        }
        imageButton.addAction(action, for: .touchUpInside)
    }
    
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
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(mainImage)
        //stackView.addArrangedSubview(hamsterImage)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
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
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            mainImage.heightAnchor.constraint(equalTo: stackView.widthAnchor)
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

