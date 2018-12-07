//
//  MockSignUpView.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift
@testable import BoardlyLogin

class MockSignUpView: SignUpView {
    let inputDataSubject = PublishSubject<InputData>()
    var renderedStates: [SignUpViewState] = []
    
    func inputEmitter() -> Observable<InputData> {
        return inputDataSubject
    }
    
    func render(signUpViewState: SignUpViewState) {
        renderedStates.append(signUpViewState)
    }
}
