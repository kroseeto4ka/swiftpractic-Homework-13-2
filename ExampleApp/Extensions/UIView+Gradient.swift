//
//  UIView+Gradient.swift
//  ExampleApp
//
//  Created by Никита Сорочинский on 01.10.2024.
//

import Foundation
import UIKit

extension UIView {
    func addGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
