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
    func getProfileById(id: UUID,
                        completion: @escaping (Result<Profile,
                                               EventsInteractorError>) -> Void)
}

class EventsInteractor {
    private let eventApi: EventAPIInput
    private let profileApi: ProfileAPIInput
    init(eventApi: EventAPIInput,
         profileApi: ProfileAPIInput) {
        self.eventApi = eventApi
        self.profileApi = profileApi
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
    func getProfileById(id: UUID,
                        completion: @escaping (Result<Profile,
                                               EventsInteractorError>) -> Void) {
        profileApi.getProfilebyId(with: id) { result in
            switch result {
            case .success(let profile):
                completion(.success(Profile(dto: profile)))
            case .error(let message):
                completion(.failure(.error(message)))
            }
        }
    }
}
