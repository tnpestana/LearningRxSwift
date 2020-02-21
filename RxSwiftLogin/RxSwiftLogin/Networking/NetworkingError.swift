//
//  NetworkingError.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 07/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}
