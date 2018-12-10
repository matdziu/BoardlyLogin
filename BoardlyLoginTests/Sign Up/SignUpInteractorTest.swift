//
//  SignUpInteractorTest.swift
//  BoardlyLoginTests
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import RxBlocking
import Quick
import Nimble
@testable import BoardlyLogin

class SignUpInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("SignUpInteractor") {
            it("produces success") {
                let signUpInteractor = SignUpInteractorImpl(signUpService: MockSignUpService(mode: .success))
                let output = try! signUpInteractor.signUp(email: "matdziu@gmail.com", password: "qwerty")
                    .toBlocking()
                    .toArray()
                
                expect(output).to(equal([PartialSignUpViewState.signUpSuccess]))
            }
            
            it("produces error") {
                let signUpInteractor = SignUpInteractorImpl(signUpService: MockSignUpService(mode: .error))
                let output = try! signUpInteractor.signUp(email: "matdziu@gmail.com", password: "qwerty")
                    .toBlocking()
                    .toArray()
                
                expect(output).to(equal([PartialSignUpViewState.errorState]))
            }
        }
    }
}
