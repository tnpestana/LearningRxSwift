//
//  PayViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 23/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {
    @IBOutlet weak var lblPrice: UILabel!
    
    var viewModel: PayViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pay"
        lblPrice.text = String(viewModel?.price ?? 0)
    }
}
