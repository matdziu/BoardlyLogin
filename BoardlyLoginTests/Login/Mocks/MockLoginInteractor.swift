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
    
    func login(email: String, password: String) -> Observable<PartialLoginViewState> {
        return Observable.just(PartialLogin.LoginSuccess())
    }
}
