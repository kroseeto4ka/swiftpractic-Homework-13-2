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
	//private let imageView = UIImageView()
    private let imageContainerView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
		setupImageView()
		view.addSubview(textLabel)
        view.addSubview(imageContainerView)
		setupView()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
		textLabel.textColor = .red
		textLabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
	}
	
	private func setupImageView() {
        let imageView = UIImageView()
        
        imageContainerView.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 10
        
		imageView.image = UIImage(named: "raccoon")
		imageView.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageContainerView.addSubview(imageView)
	}
	
	private func setupView() {
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
		gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1, y: 1)
		
		// Добавляем подслой к супервью
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
	}
}

