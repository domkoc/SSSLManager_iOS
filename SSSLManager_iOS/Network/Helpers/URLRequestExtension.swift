//
//  URLRequestExtension.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Alamofire
import Foundation

extension URLRequest {
    func addQueryParameters<In: Encodable>(parameters: In) -> URLRequest {
        (try? URLEncodedFormParameterEncoder(destination: .queryString).encode(parameters.dictionary, into: self)) ?? self
    }
    func addJSONBody<In: Encodable>(body: In) -> URLRequest {
        (try? JSONParameterEncoder.default.encode(body, into: self)) ?? self
    }
}
