//
//  DriveViewController.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import UIKit

class DriveViewController: BaseViewController {
    
    var interactor: (DriveBusinessLogic & DriveDataStore)?
    var router: (DriveRoutingLogic & DriveDataPassing)?
    
    lazy var brandLabel = UILabel().configure {
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        brandLabel.text = interactor?.brand ?? ""
    }
    
    override func setupView() {
        super.setupView()
        
        title = Constants.DriveView.title
        view.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
