//
//  BuyCoordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func start(to productType: Int) {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
