//
//  UISlider+Extensions.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

extension UISlider {
    var thumbCenterX: CGFloat {
        let trackRect = self.trackRect(forBounds: frame)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
        return thumbRect.midX
    }

    var thumbHeight: CGFloat {
        let trackRect = self.trackRect(forBounds: frame)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
        let internalPadding = thumbRect.height / 8
        return thumbRect.height - internalPadding
    }
}
