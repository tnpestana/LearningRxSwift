//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let vc = HomeViewController.instantiate()
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription(to productType: Int) {
        let child = BuyCoordinator(with: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start(productType: productType)
    }
    
    func createAccount() {
        let child = CreateAccountCoordinator(with: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}


