//
//  LoginNetworking.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 07/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation
import UIKit

class LoginRequest {
    var endpoint = "/clientes/public/login"
    var session: URLSession
    
    init(config: URLSessionConfiguration) {
        self.session = URLSession(configuration: config)
    }
    
    convenience init() {
        self.init(config: .default)
    }
    
    func postLogin(with loginParameters: LoginRequestParameters, completion: @escaping (LoginRequestResponse?) -> ()) {
        NetworkRequest().postRequest(endpoint: NETK.host + endpoint, parameters: loginParameters) { (loginResponse: LoginRequestResponse?, error) in
            if let response = loginResponse {
                completion(response)
            } else if let _ = error {
                completion(nil)
            }
        }
    }
}
