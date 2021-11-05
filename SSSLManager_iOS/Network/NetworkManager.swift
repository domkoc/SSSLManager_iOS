//
//  NetworkManager.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Alamofire
import Foundation

typealias NetworkCompletion<T: Decodable> = (NetworkManager.Result<T>) -> Void
class NetworkManager {
    enum Result<T: Decodable> {
        case success(T)
        case customError(ErrorResponse)
        case other(Other)
    }
    enum Other {
        case noData
        case noInternet
        case error(Error)
        case parameterParseError
        case resultParseError
    }
    static let shared = NetworkManager()
    private let session: Session
    private init() {
        session = Session()
    }
    private var interceptor: RequestInterceptor {
        NetworkConfigurator.shared.interceptor
    }
    private var serverURL: String {
        NetworkConfigurator.shared.serverUrl
    }
    func baseRequest(method: HTTPMethod,
                     path: String) -> URLRequest? {
        try? URLRequest(url: NetworkManager.shared.serverURL + path, method: method)
    }
    func request(method: HTTPMethod,
                 path: String,
                 isAuthenticated: Bool = true,
                 acceptHttpContent: Bool = false,
                 completion: @escaping NetworkCompletion<EmptyDto>) {
        guard let request = baseRequest(method: method, path: path) else { return }
        getData(request: request,
                isAuthenticated: isAuthenticated,
                acceptHttpContent: acceptHttpContent) { result in
            switch result {
            case .success:
                completion(.success(EmptyDto()))
            case .customError(let error):
                completion(.customError(error))
            case .other(let other):
                completion(.other(other))
            }
        }
    }
    func request<In: Encodable>(method: HTTPMethod,
                                path: String,
                                parameters: In? = nil,
                                body: In? = nil,
                                isAuthenticated: Bool = true,
                                completion: @escaping NetworkCompletion<EmptyDto>) {
        guard var request = baseRequest(method: method, path: path) else { return }
        request = request
            .addQueryParameters(parameters: parameters)
            .addJSONBody(body: body)
        getData(request: request, isAuthenticated: isAuthenticated) { result in
            switch result {
            case .success:
                completion(.success(EmptyDto()))
            case .customError(let error):
                completion(.customError(error))
            case .other(let other):
                completion(.other(other))
            }
        }
    }
    func request<Out: Decodable>(method: HTTPMethod,
                                 path: String,
                                 isAuthenticated: Bool = true,
                                 completion: @escaping NetworkCompletion<Out>) {
        guard let request = baseRequest(method: method, path: path) else { return }
        getObject(request: request, isAuthenticated: isAuthenticated, completion: completion)
    }
    func request<In: Encodable, Out: Decodable>(method: HTTPMethod,
                                                path: String,
                                                parameters: In? = nil,
                                                body: In? = nil,
                                                isAuthenticated: Bool = true,
                                                completion: @escaping NetworkCompletion<Out>) {
        guard var request = baseRequest(method: method, path: path) else { return }
        request = request
            .addQueryParameters(parameters: parameters)
            .addJSONBody(body: body)
        getObject(request: request, isAuthenticated: isAuthenticated, completion: completion)
    }
    private func getObject<Out: Decodable>(request: URLRequest,
                                           isAuthenticated: Bool,
                                           completion: @escaping NetworkCompletion<Out>) {
        getData(request: request, isAuthenticated: isAuthenticated) { result in
            switch result {
            case .success(let data):
                if let data = data,
                   let response = try? JSONDecoder().decode(Out.self, from: data) {
                    completion(.success(response))
                } else {
                    completion(.other(.resultParseError))
                }
            case .customError(let error):
                completion(.customError(error))
            case .other(let other):
                completion(.other(other))
            }
        }
    }
    private func getData(request: URLRequest,
                         isAuthenticated: Bool,
                         acceptHttpContent: Bool = false,
                         completion: @escaping NetworkCompletion<Data?>) {
        var contentTypes = ["application/json"]
        if acceptHttpContent {
            contentTypes.append("text/html")
        }
        var request = request
        request.timeoutInterval = 10.0
        session.request(request, interceptor: isAuthenticated ? interceptor : nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: contentTypes)
            .response { afResponse in
                switch afResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    if let afError = error.asAFError,
                       case .sessionTaskFailed(let sessionError) = afError,
                       let urlError = sessionError as? URLError,
                       urlError.code == .notConnectedToInternet {
                        completion(.other(.noInternet))
                    } else if let data = afResponse.data,
                              let customError =  try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                        completion(.customError(customError))
                    } else {
                        completion(.other(.error(error)))
                    }
                }
            }
    }
}
