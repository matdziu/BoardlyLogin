//
//  SignUpViewRobot.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift
import Nimble
@testable import BoardlyLogin

class SignUpViewRobot {
    
    private let mockSignUpView = MockSignUpView()
    init(signUpPresenter: SignUpPresenter) {
        signUpPresenter.bind(signUpView: mockSignUpView)
    }
    
    func emitInputData(inputData: InputData) {
        mockSignUpView.inputDataSubject.onNext(inputData)
    }
    
    func assert(expectedViewStates: [SignUpViewState]) {
        expect(self.mockSignUpView.renderedStates).to(equal(expectedViewStates))
    }
}
