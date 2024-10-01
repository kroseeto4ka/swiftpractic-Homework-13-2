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
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        layer.insertSublayer(gradient, at: 0)
    }
}
