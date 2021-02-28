//
//  UIView+Extensions.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

extension UIView {
    enum gradientAxis {
        case vertical
        case horizontal
    }

    func addGradient(firstColor: UIColor,
                     secondColor: UIColor,
                     gradientAxis: gradientAxis = .vertical,
                     withCornerRadius: Bool = false) {

        let gradientLayer = getGradientLayer(colors: [firstColor.cgColor, secondColor.cgColor],
                                             gradientAxis: gradientAxis,
                                             withCornerRadius: withCornerRadius)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func getGradientLayer(colors: [CGColor],
                          gradientAxis: gradientAxis = .vertical,
                          locations: [NSNumber]? = nil,
                          withCornerRadius: Bool = false) -> CAGradientLayer {
        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = withCornerRadius ? bounds.height / 2 : 0
        if gradientAxis == .horizontal {
            gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        }
        gradientLayer.locations = locations
        gradientLayer.colors = colors
        return gradientLayer
    }
}
