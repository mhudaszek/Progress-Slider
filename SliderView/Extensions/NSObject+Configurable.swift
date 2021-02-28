//
//  NSObject+Configurable.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import Foundation

protocol Configurable {}

extension Configurable {
    @discardableResult
    func configure(_ configuration: (Self) throws -> Void) rethrows -> Self {
        try configuration(self)
        return self
    }
}

extension NSObject: Configurable {}
