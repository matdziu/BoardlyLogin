//
//  BoardlyButton.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 06/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import UIKit

class BoardlyButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.backgroundColor = UIColor(named: Color.primaryBlue.rawValue)?.cgColor
        clipsToBounds = true
        layer.cornerRadius = frame.size.height / 2.0
        setTitleColor(UIColor.white, for: .normal)
        setTitle(titleLabel?.text?.uppercased(), for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
    }
}
