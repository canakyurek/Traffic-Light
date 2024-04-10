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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupView() {
        super.setupView()
        
        
    }
}
