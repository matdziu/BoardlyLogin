//
//  ViewController.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 06/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseNavViewController, LoginView {
    
    @IBOutlet weak var loginButton: BoardlyButton!
    @IBOutlet weak var emailField: BoardlyTextField!
    @IBOutlet weak var passwordField: BoardlyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginPresenter(loginInteractor: LoginInteractorImpl(loginService: LoginServiceImpl())).bind(loginView: self)
    }
    
    func inputEmitter() -> Observable<InputData> {
        return loginButton
            .rx
            .controlEvent(UIControl.Event.touchUpInside)
            .map({ InputData(email: self.emailField.text ?? "", password: self.passwordField.text ?? "") })
    }
    
    func render(loginViewState: LoginViewState) {
        
    }
}

