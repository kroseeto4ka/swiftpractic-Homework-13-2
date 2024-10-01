//
//  CustomButton.swift
//  ExampleApp
//
//  Created by Никита Сорочинский on 01.10.2024.
//

import UIKit

class CustomButton: UIButton {
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonSelfColor: UIColor, buttonTextColor: UIColor, buttonText: String, isShadowRequired: Bool) {
        super.init(frame: .zero)
        setupButton(buttonSelfColor, buttonTextColor, buttonText, isShadowRequired)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
    
    
}

// MARK: - Setup view
extension CustomButton {
    private func setupButton(_ buttonSelfColor: UIColor,_ buttonTextColor: UIColor, _ text: String, _ isShadowRequired: Bool) {
        setTitle(text, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        setTitleColor(buttonTextColor, for: state)
        backgroundColor = buttonSelfColor
        layer.cornerRadius = Constant.corner10
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        if isShadowRequired {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 15, height: 15)
            layer.shadowOpacity = 1
            layer.shadowRadius = 10
            
        }
    }
}

// MARK: - Constants
extension CustomButton {
    enum Constant {
        static let corner20 = CGFloat(20)
        static let corner10 = CGFloat(10)
    }
}
