//
//  LoginViewState.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation

struct LoginViewState {
    var progress: Bool = false
    var emailValid: Bool = true
    var passwordValid: Bool = true
    var error: Bool = false
    var loginSuccess: Bool = false
    var isProfileFilled: Bool = false
}

