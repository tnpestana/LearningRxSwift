//
//  BuyViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    @IBOutlet weak var lblSelectedProduct: UILabel!
    var viewModel: BuyViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Buy"
        lblSelectedProduct.text = (viewModel?.product == 0) ? "First" : "Second"
    }
    
    @IBAction func btnPayTapped(_ sender: Any) {
        let price = (viewModel?.product ?? 0) * (viewModel?.quantity ?? 0)
        viewModel?.coordinator?.goToPay(price: price)
    }
}
