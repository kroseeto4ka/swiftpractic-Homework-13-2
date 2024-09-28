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
        cornerRadius: 20,
        isShadowRequired: true)
    private let raccoonImage = customImage(
        imageName: "raccoon",
        cornerRadius: 20,
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
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .white
	}
	
    //настройка слоя градиента родительского View
	private func setupView() {
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
        gradient.colors = [UIColor.systemMint.cgColor, UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
		
		// Добавляем подслой к супервью
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
	}
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.alignment = .center
        
        stackView.addArrangedSubview(raccoonImage)
        stackView.addArrangedSubview(hamsterImage)
    }
    
    //настройка констрейнтов для imageContainerView
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

