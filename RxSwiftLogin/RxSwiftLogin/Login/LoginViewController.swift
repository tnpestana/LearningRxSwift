//
//  ViewController.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 06/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import LocalAuthentication

class LoginViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var swTouchId: UISwitch!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModelBinding()
    }
    
    //MARK: Init setup
    private func setupUI() {
        btnLogin.setTitleColor(.black, for: .normal)
        btnLogin.setTitleColor(.gray, for: .disabled)
    }
    
    private func setupViewModelBinding() {
        _ = tfEmail.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.usernameText)
        _ = tfPassword.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.passwordText)
        _ = loginViewModel.hasBioLogin.bind(to: tfPassword.rx.isHidden)
        _ = loginViewModel.hasBioLogin.bind(to: swTouchId.rx.isOn)
        _ = loginViewModel.isValid.bind(to: btnLogin.rx.isEnabled)
    }
    
    //MARK: Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        loginViewModel.callLogin() { (response) in
            DispatchQueue.main.async {
                (response != nil) ? self.showSuccessMessage() : self.showErrorMessage()
            }
        }
    }
    
    @IBAction func swBiometryChanged(_ sender: Any) {
        loginViewModel.hasBioLogin.accept((sender as! UISwitch).isOn)
    }
    
    //MARK: Helper methods
    func showSuccessMessage(title: String? = nil, message: String? = nil) {
        var title = title
        if title == nil { title = "boa" }
        var message = message
        if message == nil { message = "bom login" }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorMessage(title: String? = nil, message: String? = nil) {
        var title = title
        if title == nil { title = "erro" }
        var message = message
        if message == nil { message = "bela merda" }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
