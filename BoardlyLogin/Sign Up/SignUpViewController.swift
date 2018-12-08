//
//  SignUpViewController.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 06/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class SignUpViewController: BaseNavViewController, SignUpView {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailField: BoardlyTextField!
    @IBOutlet weak var passwordField: BoardlyTextField!
    @IBOutlet weak var signUpButton: BoardlyButton!
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpPresenter(signUpInteractor: SignUpInteractorImpl(signUpService: SignUpServiceImpl())).bind(signUpView: self)
    }
    
    func inputEmitter() -> Observable<InputData> {
        return signUpButton
            .rx
            .controlEvent(UIControl.Event.touchUpInside)
            .map({ InputData(email: self.emailField.text ?? "", password: self.passwordField.text ?? "") })
    }
    
    func render(signUpViewState: SignUpViewState) {
        showErrorLabel(show: !signUpViewState.emailValid, label: emailLabel)
        showErrorLabel(show: !signUpViewState.passwordValid, label: passwordLabel)
        emailField.showError(show: !signUpViewState.emailValid)
        passwordField.showError(show: !signUpViewState.passwordValid)
        showProgress(show: signUpViewState.progress)
        
        if signUpViewState.signUpSuccess {
            navigationController?.popViewController(animated: true)
            performSegue(withIdentifier: HOME_SEGUE, sender: self)
        }
    }
    
    private func showErrorLabel(show: Bool, label: UILabel) {
        if show {
            label.textColor = UIColor(named: Color.errorRed.rawValue)
        } else {
            label.textColor = UIColor(named: Color.grey.rawValue)
        }
    }
    
    private func showProgress(show: Bool) {
        if show {
            progressView.startAnimating()
        } else {
            progressView.stopAnimating()
        }
    }
}
