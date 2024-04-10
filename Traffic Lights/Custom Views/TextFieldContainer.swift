//
//  TextFieldContainer.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit
import SnapKit

class TextFieldContainer: UIView {
    
    private var normalBorderColor = UIColor.lightGray.cgColor
    private var warningBorderColor = UIColor.red.cgColor

    lazy var titleLabel = UILabel().configure {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    lazy var textField = UITextField().configure {
        $0.setLeftPaddingPoints(8)
        $0.setRightPaddingPoints(8)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = normalBorderColor
        $0.layer.cornerRadius = 8
    }
    
    lazy var footerLabel = UILabel().configure {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .red
    }
    
    lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, textField]).configure {
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fill
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(8)
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    public func setDelegate(_ delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
    
    public func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
    public func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
    
    public func setText(_ text: String) {
        textField.text = text
    }

    public func checkState() -> Bool {
        guard let text = textField.text else {
            showNormalState()
            return true
        }
        if text.isEmpty {
            footerLabel.text = Constants.TextContainer.emptyTextMessage
            showWarningState()
            return false
        } else if text.count < 3 {
            footerLabel.text = Constants.TextContainer.min3CharMessage
            return false
        }
        showNormalState()
        return true
    }
    
    private func showWarningState() {
        textField.layer.borderColor = warningBorderColor
        stackView.addArrangedSubview(footerLabel)
    }
    
    private func showNormalState() {
        footerLabel.removeFromSuperview()
        textField.layer.borderColor = normalBorderColor
    }
}
