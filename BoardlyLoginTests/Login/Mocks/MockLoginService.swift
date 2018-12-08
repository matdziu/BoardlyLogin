//
//  MockLoginService.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 08/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift
@testable import BoardlyLogin

class MockLoginService: LoginService {
    
    private let mode: LoginServiceMode
    
    init(mode: LoginServiceMode) {
        self.mode = mode
    }
    
    func login(email: String, password: String) -> Observable<Bool> {
        return Observable.just(mode == .success)
    }
}

enum LoginServiceMode {
    case success, error
}
