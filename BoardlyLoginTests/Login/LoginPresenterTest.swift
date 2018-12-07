//
//  LoginPresenterTest.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//
import Quick
import RxSwift
@testable import BoardlyLogin

class MockLoginInteractor: LoginInteractor {
    
    func login(email: String, password: String) -> Observable<PartialLoginViewState> {
        return Observable.just(PartialLogin.LoginSuccess())
    }
}

class LoginPresenterTest: QuickSpec{
    
    override func spec() {
        super.spec()
        
        var presenter: LoginPresenter!
        var loginViewRobot: LoginViewRobot!
        
        beforeEach {
            presenter = LoginPresenter(loginInteractor: MockLoginInteractor())
            loginViewRobot = LoginViewRobot(loginPresenter: presenter)
        }
        
        describe("Login Presenter") {
            context("valid data") {
                it("login success") {
                    loginViewRobot.emitInputData(inputData: InputData(email: "matdziu@gmail.com", password: "asdadjakdj"))
                    loginViewRobot.assert(expectedViewStates: [
                        LoginViewState(),
                        LoginViewState(progress: true),
                        LoginViewState(progress: true, loginSuccess: true)])
                }
            }
            
            context("invalid data") {
                it("email and password are shown as invalid") {
                    loginViewRobot.emitInputData(inputData: InputData(email: "", password: ""))
                    loginViewRobot.assert(expectedViewStates: [
                        LoginViewState(),
                        LoginViewState(emailValid: false, passwordValid: false)])
                }
            }
        }
    }
}
