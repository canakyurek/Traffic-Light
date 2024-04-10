//
//  BrandInteractor.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

protocol BrandBusinessLogic {
    
}

protocol BrandDataStore {
    var brand: String? { get set }
}

class BrandInteractor: BrandDataStore {
    var brand: String?
}

extension BrandInteractor: BrandBusinessLogic {
    
}
