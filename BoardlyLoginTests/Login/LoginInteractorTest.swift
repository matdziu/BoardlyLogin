//
//  LoginInteractorTest.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import Quick
import RxBlocking
import Nimble
@testable import BoardlyLogin

class LoginInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("LoginInteractor") {
            it("produces success") {
                let loginInteractor = LoginInteractorImpl(loginService: MockLoginService(mode: .success))
                let output = try! loginInteractor.login(email: "matdziu@gmail.com", password: "qwerty")
                    .toBlocking()
                    .toArray()
                
                self.expect(actualValues: output, expectedValues: [PartialLogin.LoginSuccess()])
            }
            
            it("produces error") {
                let loginInteractor = LoginInteractorImpl(loginService: MockLoginService(mode: .error))
                let output = try! loginInteractor.login(email: "matdziu@gmail.com", password: "qwerty")
                    .toBlocking()
                    .toArray()
                
                self.expect(actualValues: output, expectedValues: [PartialLogin.ErrorState()])
            }
        }
    }
}
