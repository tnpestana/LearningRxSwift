//
//  ViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    @IBOutlet weak var segmentProduct: UISegmentedControl!
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription(to: segmentProduct.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}

