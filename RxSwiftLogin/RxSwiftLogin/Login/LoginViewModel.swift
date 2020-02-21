//
//  LoginViewModel.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 06/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import LocalAuthentication

struct LoginViewModel {
    var usernameText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")
    var hasBioLogin = BehaviorRelay<Bool>(value: false)
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(usernameText.asObservable(), passwordText.asObservable(), hasBioLogin.asObservable()) { username, password, biometric in
            username.count >= 3 && (password.count >= 3 || biometric)
        }
    }
    
    func callLogin(completion: @escaping (LoginRequestResponse?) -> ()) {
        let loginParameters = LoginRequestParameters(username: usernameText.value, password: passwordText.value)
        if hasBioLogin.value {
            BiometricHandler().biometricAuthentication { (success) in
                if success {
                    LoginRequest().postLogin(with: loginParameters) { (response) in
                        completion(response)
                    }
                }
            }
        } else {
            LoginRequest().postLogin(with: loginParameters) { (response) in
                completion(response)
            }
        }
    }
}
