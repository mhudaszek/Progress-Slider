//
//  DesignableSlider.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

class DesignableSlider: UISlider {

    var trackRect: ((CGFloat) -> Void)?

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }

    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        var thumbRect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        if value < 0.1 {
            thumbRect.origin.x -= 5
        } else if value > 0.99 {
            thumbRect.origin.x += 5
        }
        return thumbRect
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.trackRect(forBounds: bounds)
        result.origin.x = 0
        result.size.width = bounds.size.width
        result.size.height = 4

        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: result, value: value)
        self.trackRect?(thumbRect.midX)
        return result
    }
}
