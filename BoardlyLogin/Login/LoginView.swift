//
//  LoginView.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginView {
    
    func render(loginViewState: LoginViewState)
    
    func inputEmitter() -> Observable<InputData>
}
