//
//  MockLoginInteractor.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 08/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

@testable import BoardlyLogin
import RxSwift

class MockLoginInteractor: LoginInteractor {
    
    private let mode: LoginInteractorMode
    
    init(mode: LoginInteractorMode) {
        self.mode = mode
    }
    
    func login(email: String, password: String) -> Observable<PartialLoginViewState> {
        if mode == .success {
            return Observable.just(.loginSuccess)
        } else {
            return Observable.just(.errorState)
        }
    }
}

enum LoginInteractorMode {
    case success, error
}
