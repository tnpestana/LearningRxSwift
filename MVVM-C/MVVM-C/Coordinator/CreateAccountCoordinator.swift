//
//  CreateAccountCoordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    override func start() {
        let vc = CreateAccountViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
    
    override func finish() {
        parentCoordinator?.removeChild(self)
    }
}
