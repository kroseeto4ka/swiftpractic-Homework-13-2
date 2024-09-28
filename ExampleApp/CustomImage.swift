//
//  CustomImage.swift
//  ExampleApp
//
//  Created by Никита Сорочинский on 28.09.2024.
//
import UIKit

class customImage: UIView {
    private let image = UIImageView()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(imageName: String, cornerRadius: CGFloat, isShadowRequired: Bool){
        super.init(frame: .zero)
        setupImage(imageName, cornerRadius)
        setupImageView(isShadowRequired)
        setupLayout()
    }
    
    private func setupImage(_ imageName: String, _ cornerRadius: CGFloat) {
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = cornerRadius
        image.clipsToBounds = true
        
        //настройка режима отображения изображения
        image.contentMode = .scaleAspectFill
    }
    
    private func setupImageView(_ isShadowRequired: Bool) {
        if isShadowRequired {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 15, height: 15)
            layer.shadowOpacity = 1
            layer.shadowRadius = 10
        }
        
        addSubview(image)
    }
    
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
}
