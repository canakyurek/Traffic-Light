//
//  BrandRouter.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

protocol BrandRoutingLogic {
    func routeToDriving()
}

protocol BrandDataPassing {
    var dataStore: BrandDataStore? { get set }
}

class BrandRouter: BrandDataPassing {
    var dataStore: BrandDataStore?
    
    weak var viewController: BrandViewController?
}

extension BrandRouter: BrandRoutingLogic {
    func routeToDriving() {
        let vc = DriveConfigurator.viewController
        vc.router?.dataStore?.brand = dataStore?.brand
        viewController?.show(vc, sender: nil)
    }
}
