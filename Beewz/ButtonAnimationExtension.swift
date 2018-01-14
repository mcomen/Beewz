//
//  ButtonAnimationExtension.swift
//  Goals
//
//  Created by MUHAMMED COMEN on 10/20/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//

import UIKit

extension UIButton {
    
    // Pulse
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.7
        pulse.fromValue = 0.80
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.4
        pulse.damping = 1.0
        // Add
        layer.add(pulse, forKey: "pulse")
    }
    
    // Flash
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.8
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        // Add
        layer.add(flash, forKey: nil)
    }
    
    // Shakes
    func shake() {
        // Add
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
