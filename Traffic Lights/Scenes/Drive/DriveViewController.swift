//
//  DriveViewController.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit

class DriveViewController: BaseViewController {
    
    // MARK: - VIP cycle elements
    
    var interactor: (DriveBusinessLogic & DriveDataStore)?
    var router: (DriveRoutingLogic & DriveDataPassing)?
    
    // MARK: - Lazy variables
    
    lazy var brandLabel = UILabel().configure {
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    lazy var lightView = TrafficLightView(lights: [
        LightModel(color: .red, duration: 4),
        LightModel(color: .orange, duration: 1),
        LightModel(color: .green, duration: 4)
    ]).configure {
        $0.startAnimating()
    }
    
    lazy var stackView = UIStackView(arrangedSubviews: [brandLabel, lightView]).configure {
        $0.axis = .vertical
        $0.spacing = 16
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    // MARK: - Lifecycle methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBrandLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        lightView.stopAnimating()
    }
    
    // MARK: - Private methods
    
    private func setupBrandLabel() {
        brandLabel.text = interactor?.brand ?? ""
    }
    
    // MARK: - Setup UI
    
    override func setupView() {
        super.setupView()
        
        title = Constants.DriveView.title
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(64)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
