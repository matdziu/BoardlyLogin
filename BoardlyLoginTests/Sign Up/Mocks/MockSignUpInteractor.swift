//
//  MockSignUpInteractor.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 08/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

@testable import BoardlyLogin
import RxSwift

class MockSignUpInteractor: SignUpInteractor {
    
    private let mode: SignUpInteractorMode
    
    init(mode: SignUpInteractorMode) {
        self.mode = mode
    }
    
    func signUp(email: String, password: String) -> Observable<PartialSignUpViewState> {
        if mode == .success {
            return Observable.just(.signUpSuccess)
        } else {
            return Observable.just(.errorState)
        }
    }
}

enum SignUpInteractorMode {
    case success, error
}
