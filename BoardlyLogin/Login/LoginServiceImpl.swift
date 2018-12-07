//
//  LoginServiceImpl.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift

class LoginServiceImpl: LoginService {
    
    func login(email: String, password: String) -> Observable<Bool> {
        return .just(true)
    }
}
