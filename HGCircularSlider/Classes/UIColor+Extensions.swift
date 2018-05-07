//
//  UIColor+Extensions.swift
//  VirginMobileMX
//
//  Created by Patrick Gorospe on 5/1/18.
//  Copyright © 2018 Virgin Mobile Mexico. All rights reserved.
//

import UIKit

extension UIColor {
    func transitionTo(_ end: UIColor,withIncrement increment: CGFloat) -> UIColor? {
        let f = min(max(0, increment), 1)
        
        guard let c1 = self.cgColor.components, let c2 = end.cgColor.components else { return nil }
        
        let r: CGFloat = CGFloat(c1[0] + (c2[0] - c1[0]) * f)
        let g: CGFloat = CGFloat(c1[1] + (c2[1] - c1[1]) * f)
        let b: CGFloat = CGFloat(c1[2] + (c2[2] - c1[2]) * f)
        let a: CGFloat = CGFloat(c1[3] + (c2[3] - c1[3]) * f)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    func gradientColorsWithEndColor(_ endColor:UIColor) -> CGGradient {
        let colors = [self.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        return CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)!
    }
}
