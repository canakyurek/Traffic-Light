//
//  BaseViewController.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        handleKeyboard()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: Hide Keyboard
    private func handleKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc public dynamic func hideKeyboard() {
        view.endEditing(true)
        
    }
}
