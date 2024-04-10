//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {
    
    lazy var brandTextFieldContainer = TextFieldContainer().configure {
        $0.setPlaceholder(Constants.BrandView.placeholderTitle)
    }
    
    lazy var actionButton = UIButton().configure {
        $0.setTitle(Constants.BrandView.actionButtonTitle, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        title = Constants.BrandView.title
        view.backgroundColor = .white
        
        view.addSubview(brandTextFieldContainer)
        brandTextFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }
        
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).inset(-16)
            make.height.equalTo(48)
        }
    }
}

