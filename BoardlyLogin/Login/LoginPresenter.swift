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
    private let disposeBag = DisposeBag()
    private var initialViewState = LoginViewState()
    
    init(loginInteractor: LoginInteractor, initialViewState: LoginViewState = LoginViewState()) {
        self.loginInteractor = loginInteractor
        self.initialViewState = initialViewState
    }
    
    func bind(loginView: LoginView) {
        let inputDataObservable = loginView.inputEmitter()
            .flatMap { (inputData: InputData) -> Observable<PartialLoginViewState> in
                let trimmedEmail = inputData.email.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedPassword = inputData.password.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let emailValid = !trimmedEmail.isEmpty
                let passwordValid = !trimmedPassword.isEmpty
                
                if !emailValid || !passwordValid {
                    return Observable.just(PartialLogin.LocalValidation(emailValid: emailValid, passwordValid: passwordValid))
                } else {
                    return self.loginInteractor.login(email: trimmedEmail, password: trimmedPassword).startWith(PartialLogin.ProgressState())
                }
        }
        
        Observable
            .merge([inputDataObservable])
            .scan(initialViewState) { (viewState: LoginViewState, partialState: PartialLoginViewState) -> LoginViewState in
                return self.reduce(previousState: viewState, partialState: partialState)
            }
            .startWith(initialViewState)
            .observeOn(MainScheduler.instance)
            .subscribe (onNext: {(viewState: LoginViewState) in
                loginView.render(loginViewState: viewState)
            })
            .disposed(by: disposeBag)
    }
    
    private func reduce(previousState: LoginViewState, partialState: PartialLoginViewState) -> LoginViewState {
        return partialState.reduce(previousState: previousState)
    }
}
