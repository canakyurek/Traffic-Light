//
//  TextFieldContainerViewModel.swift
//  Traffic Lights
//
//  Created by Can Akyürek on 15.04.2024.
//

import UIKit

class TextFieldContainerViewModel {
    
    let minCharacter = 3
    let normalBorderColor = UIColor.lightGray.cgColor
    let warningBorderColor = UIColor.red.cgColor
    let minCharacterErrorMessage = Constants.TextContainer.minCharMessage
    let emptyTextFieldErrorMessage = Constants.TextContainer.emptyTextMessage
    
    func checkMinCharacterLimit(_ text: String) -> Bool {
        return text.count >= minCharacter
    }
    
    func checkEmpty(_ text: String) -> Bool {
        return text.isEmpty
    }
}

