//
//  CreateAccountCoordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
}
