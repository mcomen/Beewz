//
//  UIView+Extension.swift
//  YT - Gradient
//
//  Created by Sean Allen on 4/26/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        // Gradient 
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        // Add
        layer.addSublayer(gradientLayer)
    }
}
