//
//  BrandConfigurator.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

class BrandConfigurator {
    class var viewController: BrandViewController {
        let viewController = BrandViewController()
        let interactor = BrandInteractor()
        let router = BrandRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        router.viewController = viewController
        
        return viewController
    }
}
