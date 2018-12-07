//
//  ViewExtensions.swift
//  BoardlyLogin
//
//  Created by Mateusz Dziubek on 07/12/2018.
//  Copyright © 2018 Mateusz Dziubek. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: UIView {
    
    func show(show: Bool) {
        for view in self {
            view.isHidden = show
        }
    }
}
