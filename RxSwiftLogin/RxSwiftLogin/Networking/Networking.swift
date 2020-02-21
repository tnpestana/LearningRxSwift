//
//  LoginNetworking.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 07/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation

struct NETK {
    static var host = "http://10.97.248.242:9081"
    
    enum HTTPMethod: String {
        case POST = "POST"
        case GET = "GET"
    }
}
