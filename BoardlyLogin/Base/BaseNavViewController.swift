//
//  BaseNavViewController.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 06/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import UIKit

class BaseNavViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(named: Color.primaryBlue.rawValue)
    }
}
