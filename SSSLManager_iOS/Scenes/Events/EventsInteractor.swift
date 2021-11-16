//
//  EventsInteractor.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation

struct EventsInteractorSuccess {
    
}

enum EventsInteractorError: Error {
    case error(String)
}

protocol EventsInteractorInput: AnyObject {
    func getEvents(completion: @escaping (Result<[Event], EventsInteractorError>) -> Void)
    func createNewEvent(newEvent: NewEvent,
                        completion: @escaping (Result<Event,
                                               EventsInteractorError>) -> Void)
}

class EventsInteractor {
    private let eventApi: EventAPIInput
    init(eventApi: EventAPIInput) {
        self.eventApi = eventApi
    }
}

extension EventsInteractor: EventsInteractorInput {
    func getEvents(completion: @escaping (Result<[Event], EventsInteractorError>) -> Void) {
        eventApi.getAllEvent { result in
            switch result {
            case .success(let events):
                completion(.success(events.asEvent()))
            case .error(let message):
                completion(.failure(.error(message)))
            }
        }
    }
    func createNewEvent(newEvent: NewEvent,
                        completion: @escaping (Result<Event,
                                               EventsInteractorError>) -> Void) {
        eventApi.createNewEvent(with: newEvent.dto) { result in
            switch result {
            case .success(let event):
                completion(.success(Event.init(dto: event)))
            case .error(let message):
                completion(.failure(.error(message)))
            }
        }
    }
}
