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
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signUpButton: BoardlyButton!
    @IBOutlet weak var privacyPolicyLabel: UILabel!
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    private var contentViewArray: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentViewArray = [loginButton, emailField, passwordField, emailLabel, passwordLabel, signUpButton, privacyPolicyLabel]
        initPrivacyPolicyOnClick()
        LoginPresenter(loginInteractor: LoginInteractorImpl(loginService: LoginServiceImpl())).bind(loginView: self)
    }
    
    func inputEmitter() -> Observable<InputData> {
        return loginButton
            .rx
            .controlEvent(UIControl.Event.touchUpInside)
            .map({ InputData(email: self.emailField.text ?? "", password: self.passwordField.text ?? "") })
    }
    
    func render(loginViewState: LoginViewState) {
        showErrorLabel(show: !loginViewState.emailValid, label: emailLabel)
        showErrorLabel(show: !loginViewState.passwordValid, label: passwordLabel)
        emailField.showError(show: !loginViewState.emailValid)
        passwordField.showError(show: !loginViewState.passwordValid)
        showProgress(show: loginViewState.progress)
        
        if loginViewState.loginSuccess {
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
        contentViewArray.show(show: show)
        if show {
            progressView.startAnimating()
        } else {
            progressView.stopAnimating()
        }
    }
    
    func initPrivacyPolicyOnClick() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(openPrivacyPolicyPage))
        privacyPolicyLabel.addGestureRecognizer(tap)
    }
    
    @objc func openPrivacyPolicyPage() {
        if let link = URL(string: "https://google.com") {
            UIApplication.shared.open(link)
        }
    }
}

