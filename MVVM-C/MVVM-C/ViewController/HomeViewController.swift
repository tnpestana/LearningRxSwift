//
//  ViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var segmentProduct: UISegmentedControl!
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        viewModel?.coordinator?.buySubscription(to: segmentProduct.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        viewModel?.coordinator?.createAccount()
    }
}

