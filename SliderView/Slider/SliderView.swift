//
//  SliderView.swift
//  SliderView
//
//  Created by Mirosław Hudaszek on 28/02/2021.
//

import UIKit

class SliderView: View {
    private struct Constants {
        static let intervalProgressCount = 6
    }
    private let sliderBackgroundView = UIView()
    private var slider = DesignableSlider().configure {
        $0.minimumTrackTintColor = .clear
        $0.maximumTrackTintColor = .clear
    }

    private let progressView = UIView()

    override func setup() {
        super.setup()
        addSubviews()
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
}

private extension SliderView {
    func addSubviews() {
        addSubview(sliderBackgroundView)
        addSubview(progressView)
        addSubview(slider)
    }

    func setupConstraints() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7)
        ])

        sliderBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sliderBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sliderBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sliderBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sliderBackgroundView.heightAnchor.constraint(equalToConstant: slider.thumbHeight)
        ])

        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            progressView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 15),
            progressView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
}

private extension SliderView {
    func setupView() {
        setupSliderBackgroundView()
        setupProgressViews()
        trackProgressView()
        sliderBackgroundView.addGradient(firstColor: .white,
                                         secondColor: .red,
                                         gradientAxis: .horizontal)
    }

    func setupSliderBackgroundView() {
        let radius = sliderBackgroundView.frame.height / 2
        let freeform = UIBezierPath()
        freeform.move(to: CGPoint(x: 0, y: sliderBackgroundView.frame.height / 3))
        freeform.addLine(to: CGPoint(x: frame.width - radius - 2, y: 0))
        freeform.addArc(withCenter: CGPoint(x: frame.width - radius - 2, y: radius), radius: radius, startAngle: CGFloat(3 * Double.pi / 2), endAngle: .pi / 2, clockwise: true)
        freeform.addLine(to: CGPoint(x: frame.width - radius, y: sliderBackgroundView.frame.height))
        freeform.addLine(to: CGPoint(x: 0, y: sliderBackgroundView.frame.height))
        let shape = CAShapeLayer()
        shape.path = freeform.cgPath
        sliderBackgroundView.layer.mask = shape
    }

    func setupProgressViews() {
        for viewNumber in 0...Constants.intervalProgressCount {
            let progressItemView = UIView()
            progressItemView.backgroundColor = .red
            progressItemView.frame.size.width = 1.5
            progressItemView.frame.size.height = 8

            let startX = slider.thumbCenterX - 2
            let progressRangeWidth = progressView.frame.width - startX - (frame.width - (frame.width - startX + 2))
            let constantSpaceBetweenProgressViews = (progressRangeWidth) / CGFloat(integerLiteral: Constants.intervalProgressCount)
            let progressSpaceX = startX + CGFloat(integerLiteral: viewNumber * Int(constantSpaceBetweenProgressViews) )

            progressItemView.frame.origin.x = progressSpaceX
            progressView.addSubview(progressItemView)
        }
    }

    func trackProgressView() {
        slider.trackRect = { progress in
            self.progressView.subviews.forEach { $0.backgroundColor = progress >= $0.frame.origin.x ? .red : .lightGray }
        }
    }
}
