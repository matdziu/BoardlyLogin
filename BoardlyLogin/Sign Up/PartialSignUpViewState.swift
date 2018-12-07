//
//  PartialSignUpViewState.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation

protocol PartialSignUpViewState {
    func reduce(previousState: SignUpViewState) -> SignUpViewState
}

struct ProgressState: PartialSignUpViewState {
    func reduce(previousState: SignUpViewState) -> SignUpViewState {
        return SignUpViewState(progress: true)
    }
}

struct LocalValidation: PartialSignUpViewState {
    
    var emailValid: Bool = false
    var passwordValid: Bool = false
    
    func reduce(previousState: SignUpViewState) -> SignUpViewState {
        return SignUpViewState(emailValid: emailValid, passwordValid: passwordValid)
    }
}

struct SignUpSuccess: PartialSignUpViewState {
    
    func reduce(previousState: SignUpViewState) -> SignUpViewState {
        return SignUpViewState(progress: true, signUpSuccess: true)
    }
}

struct ErrorState: PartialSignUpViewState {
    
    func reduce(previousState: SignUpViewState) -> SignUpViewState {
        return SignUpViewState(error: true)
    }
}