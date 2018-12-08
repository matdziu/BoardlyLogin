//
//  QuickSpecExtensions.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 08/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Quick
import Nimble

extension QuickSpec {
    
    func expect<T: Equatable>(actualValues: [Any], expectedValues: [T]) {
        for (index, actualValue) in actualValues.enumerated() {
            expect(actualValue: actualValue, expectedValue: expectedValues[index])
        }
    }
    
    func expect<T: Equatable>(actualValue: Any, expectedValue: T) {
        let castedActualValue = actualValue as? T
        if castedActualValue != nil {
            Nimble.expect(castedActualValue).to(equal(expectedValue))
        }
        else {
            Nimble.expect(castedActualValue).toNot(beNil())
            print("Actual value did not match the expected one of type \(T.self)")
        }
    }
}
