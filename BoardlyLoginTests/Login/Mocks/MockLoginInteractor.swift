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
            return Observable.just(PartialLogin.LoginSuccess())
        } else {
            return Observable.just(PartialLogin.ErrorState())
        }
    }
}

enum LoginInteractorMode {
    case success, error
}
