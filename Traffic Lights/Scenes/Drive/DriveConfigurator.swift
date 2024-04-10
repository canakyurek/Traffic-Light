//
//  DriveConfigurator.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

class DriveConfigurator {
    class var viewController: DriveViewController {
        let viewController = DriveViewController()
        let interactor = DriveInteractor()
        let router = DriveRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
