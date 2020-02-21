//
//  FetchRequest.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 07/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation
import ProgressHUD

struct NetworkRequest {
    typealias JSONTaskCompletionHandler = (Decodable?, NetworkingError?) -> Void
    var session = URLSession()
    
    private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                         completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
    
    func fetchRequest<T: Decodable>(completion: @escaping (T) -> ()) {
        let urlString = ""
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let jsonError {
                print("failed to decode JSON: ", jsonError)
            }
        }.resume()
    }
    
    func postRequest<T: Decodable, U: Encodable>(endpoint: String, parameters: U, customHttpHeaders: [String: String] = [:], completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: endpoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = NETK.HTTPMethod.POST.rawValue

        // Encode parameters object to JSON as URL request body
        guard let httpBody = try? JSONEncoder().encode(parameters) else { return }
        request.httpBody = httpBody
        
        // Set HTTP headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in Array(customHttpHeaders) {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }

        ProgressHUD.show()
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            ProgressHUD.dismiss()
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    ProgressHUD.showSuccess()
                    completion(json, nil)
                    print(json)
                } catch {
                    ProgressHUD.showError()
                    completion(nil, error)
                    print(error)
                }
            }
        }.resume()
    }
    
//    func postRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
//        guard var request = endpoint?.request else { return nil }
//        request.httpMethod = HTTPMethod.POST.rawValue
//        do {
//            request.httpBody = try JSONEncoder().encode(parameters)
//        } catch let error {
//            //print(NetworkingError.postParametersEncodingFalure(description: "\(error)").customDescription)
//            return nil
//        }
//        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
//        return request
//    }
}
