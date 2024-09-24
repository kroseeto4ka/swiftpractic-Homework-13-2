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
	private let imageView = UIImageView()
    private let imageContainerView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
		setupImageView()
		view.addSubview(textLabel)
        setupImage()
        view.addSubview(imageContainerView)
        setupLayout()
		setupView()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .white
	}
	
    //перенёс настройку imageView в отдельную функцию, без этого картинка просто не появлялась даже в view hierarchy
	private func setupImageView() {
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 10
	}
    
    private func setupImage() {
        imageView.image = UIImage(named: "raccoon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        // Добавляем imageView в контейнер
        imageContainerView.addSubview(imageView)
    }
	
    //настройка слоя градиента родительского View
	private func setupView() {
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
		
		// Добавляем подслой к супервью
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
	}
    
    //настройка констрейнтов для imageContainerView
    private func setupLayout() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor)
            ])
        
        //настройка режима отображения imageView
        imageView.contentMode = .scaleAspectFill
    }
}

