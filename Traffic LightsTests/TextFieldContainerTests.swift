//
//  Traffic_LightsTests.swift
//  Traffic LightsTests
//
//  Created by Can Akyürek on 15.04.2024.
//

import XCTest
@testable import Traffic_Lights

final class TextFieldContainerTests: XCTestCase {
    
    var sut: TextFieldContainerViewModel!

    override func setUpWithError() throws {
        
        sut = TextFieldContainerViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testTextFieldMinimumCharacterLimit() {
        // Given
        let atLimitCharacters = String(repeating: "a", count: sut.minCharacter)
        
        // When
        let result = sut.checkMinCharacterLimit(atLimitCharacters)
        
        // Then
        XCTAssertTrue(result, "The textField should allow at least \(sut.minCharacter) characters.")
    }
    
    func testTextFieldMinimumCharacterLimitNotSatisfied() {
        // Given
        let belowLimitCharacters = String(repeating: "a", count: sut.minCharacter - 1)
        
        // When
        let result = sut.checkMinCharacterLimit(belowLimitCharacters)
        
        // Then
        XCTAssertFalse(result, "The textField should allow at least \(sut.minCharacter) characters. The text contains \(belowLimitCharacters.count) instead")
    }
}
