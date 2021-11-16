//
//  EventAPI.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Alamofire
import Foundation

protocol EventAPIInput {
    func getAllEvent(completion: @escaping (APIBase.APIResult<[EventDownloadDto]>) -> Void)
}

class EventAPI: APIBase { }

extension EventAPI: EventAPIInput {
    func getAllEvent(completion: @escaping (APIBase.APIResult<[EventDownloadDto]>) -> Void) {
        NetworkManager.shared.request(method: .get,
                                      path: "/events/all",
                                      isAuthenticated: true,
                                      completion: { (result: NetworkManager.Result<[EventDownloadDto]>) in
                                        switch result {
                                        case .success(let events):
                                            completion(.success(events))
                                        case .customError(let error):
                                            let message = self.errorManager.errorMessage(for: error)
                                            completion(.error(message))
                                        case .other:
                                            let message = self.errorManager.errorMessage()
                                            completion(.error(message))
                                        }
                                      })
    }
}