//
//  BoardlyTextField.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 06/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import UIKit

class BoardlyTextField: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor(named: Color.primaryBlue.rawValue)?.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        layer.cornerRadius = frame.size.height / 5.0
    }
    
    func showError(show: Bool) {
        var borderColor = Color.primaryBlue
        if (show) {
            borderColor = Color.errorRed
        }
        layer.borderColor = UIColor(named: borderColor.rawValue)?.cgColor
    }
}
