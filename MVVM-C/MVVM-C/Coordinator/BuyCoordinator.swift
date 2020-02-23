//
//  BuyCoordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    func start(productType: Int) {
        let viewModel = BuyViewModel()
        viewModel.product = productType
        viewModel.coordinator = self
        let vc = BuyViewController.instantiate()
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToPay(price: Int) {
        let viewModel = PayViewModel()
        viewModel.price = price
        viewModel.coordinator = self
        let vc = PayViewController.instantiate()
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
}
