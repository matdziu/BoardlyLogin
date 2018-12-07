//
//  SignUpPresenter.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift

class SignUpPresenter {
    
    private let signUpInteractor: SignUpInteractor
    private let disposeBag = DisposeBag()
    private var initialViewState = SignUpViewState()
    
    init(signUpInteractor: SignUpInteractor, initialViewState: SignUpViewState = SignUpViewState()) {
        self.signUpInteractor = signUpInteractor
        self.initialViewState = initialViewState
    }
    
    func bind(signUpView: SignUpView) {
        let inputDataObservable = signUpView.inputEmitter()
            .flatMap { (inputData: InputData) -> Observable<PartialSignUpViewState> in
                let trimmedEmail = inputData.email.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedPassword = inputData.password.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let emailValid = !trimmedEmail.isEmpty
                let passwordValid = !trimmedPassword.isEmpty && trimmedPassword.count > 6
                
                if !emailValid || !passwordValid {
                    return Observable.just(LocalValidation(emailValid: emailValid, passwordValid: passwordValid))
                } else {
                    return self.signUpInteractor.signUp(email: trimmedEmail, password: trimmedPassword).startWith(ProgressState())
                }
        }
        
        Observable
            .merge([inputDataObservable])
            .scan(initialViewState) { (viewState: SignUpViewState, partialState: PartialSignUpViewState) -> SignUpViewState in
                return self.reduce(previousState: viewState, partialState: partialState)
            }
            .startWith(initialViewState)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {(viewState: SignUpViewState) in
                signUpView.render(signUpViewState: viewState)
            })
            .disposed(by: disposeBag)
    }
    
    private func reduce(previousState: SignUpViewState, partialState: PartialSignUpViewState) -> SignUpViewState {
        return partialState.reduce(previousState: previousState)
    }
}

