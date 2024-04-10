//
//  TrafficLightView.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit

struct LightModel {
    let color: UIColor
    let duration: Double
}

class TrafficLightView: UIView {
    
    lazy var stackView = UIStackView().configure {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.alignment = .center
    }
    
    private var animationIndex = 0
    private var shouldAnimate = true
    
    private var lights: [LightModel] = [
        LightModel(color: .red, duration: 4),
        LightModel(color: .orange, duration: 4),
        LightModel(color: .green, duration: 1)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLights() {
        for item in lights {
            drawLightView(item.color.withAlphaComponent(0.5))
        }
    }
    
    func startAnimating() {
        guard shouldAnimate else { return }
        
        let view = stackView.arrangedSubviews[animationIndex]
        let element = lights[animationIndex]
        
        UIView.animate(withDuration: 0.5) {
            view.backgroundColor = element.color
        } completion: { _ in
            self.animationIndex += 1
            if self.animationIndex == self.lights.count {
                self.animationIndex = 0
            }
            UIView.animate(withDuration: 0.5, delay: element.duration) {
                view.backgroundColor = element.color.withAlphaComponent(0.2)
            } completion: { _ in
                self.startAnimating()
            }
        }
    }
    
    public func stopAnimating() {
        shouldAnimate = false
    }
    
    private func drawLightView(_ color: UIColor) {
        let view = UIView()
        view.backgroundColor = color.withAlphaComponent(0.2)
        view.snp.makeConstraints { make in
            make.height.width.equalTo(64)
        }
        
        stackView.addArrangedSubview(view)
        stackView.layoutIfNeeded()
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    private func setupView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(16)
        }
        setLights()
        startAnimating()
    }
}


