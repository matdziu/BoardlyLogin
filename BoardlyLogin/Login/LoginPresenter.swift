//
//  LoginPresenter.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter {
    
    private let loginInteractor: LoginInteractor
    
    init(loginInteractor: LoginInteractor) {
        self.loginInteractor = loginInteractor
    }
    
    func bind(loginView: LoginView) {
        let inputDataObservable = loginView.inputEmitter()
            .flatMap { (inputData: InputData) -> Observable<PartialLoginViewState> in
                let trimmedEmail = inputData.email.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedPassword = inputData.password.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let emailValid = !trimmedEmail.isEmpty
                let passwordValid = !trimmedPassword.isEmpty
                
                if !emailValid || !passwordValid {
                    return Observable.just(LocalValidation(emailValid: emailValid, passwordValid: passwordValid))
                } else {
                    return self.loginInteractor.login(email: trimmedEmail, password: trimmedPassword).startWith(ProgressState())
                }
        }
        
        
    }
}
