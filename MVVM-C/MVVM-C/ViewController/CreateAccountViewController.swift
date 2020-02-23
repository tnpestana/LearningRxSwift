//
//  CreateAccountViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    //var coordinator: CreateAccountCoordinator?
    var viewModel: CreateAccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create Account"
        // Do any additional setup after loading the view.
    }
}
