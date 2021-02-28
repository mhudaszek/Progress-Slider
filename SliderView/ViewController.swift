//
//  ViewController.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

class ViewController: UIViewController {

    private let slider = SliderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }

    private func setupSlider() {
        view.addSubview(slider)

        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 100),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
