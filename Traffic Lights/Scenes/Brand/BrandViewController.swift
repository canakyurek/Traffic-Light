//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit
import SnapKit

class BrandViewController: BaseViewController {
    
    // MARK: - VIP cycle elements
    
    var interactor: (BrandBusinessLogic & BrandDataStore)?
    var router: (BrandRoutingLogic & BrandDataPassing)?
    
    // MARK: - Lazy variables
    
    lazy var brandTextFieldContainer = TextFieldContainer().configure {
        $0.setPlaceholder(Constants.BrandView.placeholderTitle)
    }
    
    lazy var actionButton = UIButton().configure {
        $0.setTitle(Constants.BrandView.actionButtonTitle, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .blue
        $0.addTarget(
            self,
            action: #selector(actionButtonAction(_:)),
            for: .touchUpInside
        )
    }

    // MARK: - Setup UI
    
    override func setupView() {
        super.setupView()
        
        title = Constants.BrandView.title
        
        view.addSubview(brandTextFieldContainer)
        brandTextFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).inset(-16)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - Selector
    
    @objc private func actionButtonAction(_ sender: UIButton) {
        if brandTextFieldContainer.checkState() {
            router?.routeToDriving(withBrand: brandTextFieldContainer.textField.text)
        }
    }
}
