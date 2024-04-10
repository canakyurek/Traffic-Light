//
//  Configurable.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 10.04.2024.
//

import Foundation

public protocol Configurable { }

public extension Configurable {
    func configure(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Configurable { }
