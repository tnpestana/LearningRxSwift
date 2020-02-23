//
//  PayViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 23/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {
    var viewModel: PayViewModel?
    //var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pay"
        // Do any additional setup after loading the view.
    }
}
