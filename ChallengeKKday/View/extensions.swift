//
//  extensions.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/3/3.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 10
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
    }
}

