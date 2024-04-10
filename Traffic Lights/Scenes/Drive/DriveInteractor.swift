//
//  DriveInteractor.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

protocol DriveBusinessLogic {
    
}

protocol DriveDataStore {
    var brand: String? { get set }
}

class DriveInteractor: DriveDataStore {
    var brand: String?
}

extension DriveInteractor: DriveBusinessLogic {
    
}
