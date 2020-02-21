//
//  LoginRequestModel.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 10/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation

struct LoginRequestResponse: Decodable {
    var direct: Bool?
    var loginForte: Bool?
    var block: Bool?
    var expirado: Bool?
    var numTentativas: Int?
    var diasParaExpirar: Int?
    var atualizarPassword: Bool?
    var success: Bool?
    var error: String?
}

struct LoginRequestParameters: Encodable {
    let username: String
    let password: String
}
