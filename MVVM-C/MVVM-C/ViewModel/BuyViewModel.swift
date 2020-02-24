//
//  BuyViewModel.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 23/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation

class BuyViewModel {
    var coordinator: BuyCoordinator?
    var product : Int?
    var quantity: Int?
    
    func goToPay() {
        guard (quantity ?? 0) > 0 else { return }
        let price = (product ?? 0) * (quantity ?? 0)
        coordinator?.goToPay(price: price)
    }
}
