//
//  DriveRouter.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

protocol DriveRoutingLogic {
    
}

protocol DriveDataPassing {
    var dataStore: DriveDataStore? { get set }
}

class DriveRouter: DriveDataPassing {
    var dataStore: DriveDataStore?
    
    weak var viewController: DriveViewController?
}

extension DriveRouter: DriveRoutingLogic {
    
}
