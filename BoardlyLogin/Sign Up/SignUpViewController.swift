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
    private let signUpPresenter = SignUpPresenter(signUpInteractor: SignUpInteractorImpl(signUpService: SignUpServiceImpl()))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signUpPresenter.bind(signUpView: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        signUpPresenter.unbind()
        super.viewWillDisappear(animated)
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
            if let homeViewController = storyboard?.instantiateViewController(withIdentifier: HOME_VIEW_CONTROLLER_ID) as? HomeViewController {
                navigationController?.setViewControllers([homeViewController], animated: true)
            }
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
