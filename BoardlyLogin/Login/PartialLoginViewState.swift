//
//  PartialLoginViewState.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation

protocol PartialLoginViewState {
    func reduce(previousState: LoginViewState) -> LoginViewState
}

enum PartialLogin {
    
    struct ProgressState: PartialLoginViewState {
        func reduce(previousState: LoginViewState) -> LoginViewState {
            return LoginViewState(progress: true)
        }
    }
    
    struct LocalValidation: PartialLoginViewState {
        
        var emailValid: Bool = false
        var passwordValid: Bool = false
        
        func reduce(previousState: LoginViewState) -> LoginViewState {
            return LoginViewState(emailValid: emailValid, passwordValid: passwordValid)
        }
    }
    
    struct LoginSuccess: PartialLoginViewState {
        
        func reduce(previousState: LoginViewState) -> LoginViewState {
            return LoginViewState(progress: true, loginSuccess: true)
        }
    }
    
    struct ErrorState: PartialLoginViewState {
        
        func reduce(previousState: LoginViewState) -> LoginViewState {
            return LoginViewState(error: true)
        }
    }
}
