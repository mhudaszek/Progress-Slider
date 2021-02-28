//
//  View.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup() {}
}

