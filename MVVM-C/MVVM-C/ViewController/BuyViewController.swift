//
//  BuyViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    @IBOutlet weak var lblSelectedProduct: UILabel!
    
    var coordinator: BuyCoordinator?
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblSelectedProduct.text = (selectedProduct == 0) ? "First" : "Second"
    }
}
