//
//  TrafficLightView.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit


class TrafficLightView: UIView {
    
    lazy private var stackView = UIStackView().configure {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.alignment = .center
    }
    
    private var animationIndex = 0
    
    private var shouldAnimate = true
    
    private weak var animationTimer: Timer?
    
    private var lights: [LightModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    convenience init(lights: [LightModel]) {
        self.init(frame: .zero)
        
        self.lights = lights
        setupView()
        setLights()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func setLights() {
        for item in lights {
            drawLightView(item.color.withAlphaComponent(0.5))
        }
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
    
    private func blinkView(_ view: UIView, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5) {
            view.alpha = 0.0
        } completion: { _ in
            DispatchQueue.main.async {
                view.alpha = 1.0
                completion()
            }
        }
    }
    
    private func resetTimer() {
        DispatchQueue.main.async { [weak self] in
            self?.animationTimer?.invalidate()
            self?.animationTimer = nil
        }
    }
    
    // MARK: - Selector
    
    @objc private func handleTimer() {
        let view = stackView.arrangedSubviews[animationIndex]
        let element = lights[animationIndex]
        
        blinkView(view) { [weak self] in
            guard let self = self else { return }
            
            self.resetTimer()
            view.backgroundColor = element.color.withAlphaComponent(0.2)
            
            self.animationIndex += 1
            if self.animationIndex == self.lights.count {
                self.animationIndex = 0
            }
            
            self.animateWithTimer()
        }
    }
    
    private func animateWithTimer() {
        guard shouldAnimate else {
            return
        }
        
        let view = stackView.arrangedSubviews[animationIndex]
        let element = lights[animationIndex]
        
        blinkView(view) { [weak self] in
            guard let self = self else { return }
            
            self.animationTimer = Timer.scheduledTimer(
                timeInterval: element.duration,
                target: self,
                selector: #selector(self.handleTimer),
                userInfo: nil,
                repeats: true
            )
            view.backgroundColor = element.color
        }
    }
}

// MARK: - Exposed methods

extension TrafficLightView {
    func startAnimating() {
        animateWithTimer()
    }
    
    func stopAnimating() {
        shouldAnimate = false
        resetTimer()
    }
}
