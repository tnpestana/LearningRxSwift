//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Tiago Pestana on 12/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = Observable.from([1, 2, 3, 4, 5])
    }


}

