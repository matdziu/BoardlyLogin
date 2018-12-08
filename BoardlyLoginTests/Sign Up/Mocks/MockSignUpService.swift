//
//  MockSignUpService.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 08/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift
@testable import BoardlyLogin

class MockSignUpService: SignUpService {
    
    private let mode: SignUpServiceMode
    
    init(mode: SignUpServiceMode) {
        self.mode = mode
    }
    
    func signUp(email: String, password: String) -> Observable<Bool> {
        return Observable.just(mode == .success)
    }
}

enum SignUpServiceMode {
    case success, error
}

