//
//  BuyViewController.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    @IBOutlet weak var tfQuantity: UITextField!
    @IBOutlet weak var lblSelectedProduct: UILabel!
    var viewModel: BuyViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Buy"
        tfQuantity.text = "0"
        tfQuantity.keyboardType = .numberPad
        tfQuantity.delegate = self
        lblSelectedProduct.text = (viewModel?.product == 0) ? "First" : "Second"
    }
    
    @IBAction func btnPayTapped(_ sender: Any) {
        viewModel?.goToPay()
    }
}

extension BuyViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let nr = Int(string) else {
            textField.text = ""
            return false
        }
        viewModel?.quantity = nr
        return true
    }
}
