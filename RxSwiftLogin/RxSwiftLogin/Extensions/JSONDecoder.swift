//
//  JSONDecoder.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 07/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, withJSONObject object: Any, options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}
