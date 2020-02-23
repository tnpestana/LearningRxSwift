//
//  UIViewControllerExt.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 23/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

extension UIViewController {
    private struct Container {
        static var storedCoordinator: Coordinator?
    }
    
    var coordinator: Coordinator? {
        get {
            return Container.storedCoordinator
        }
        set(newValue) {
            Container.storedCoordinator = newValue
        }
    }
}
