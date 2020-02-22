//
//  Storyboarded.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
