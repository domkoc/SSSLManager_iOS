//
//  Event.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation

struct Event {
    var id: UUID
    var organizerID: UUID
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
    var location: String
    var isApplyable: Bool
    var applicationStart: Date?
    var applicationEnd: Date?
    var parentEventID: UUID?
    init(id: UUID,
         organizerID: UUID,
         title: String,
         description: String,
         startDate: Date,
         endDate: Date,
         location: String,
         isApplyable: Bool,
         applicationStart: Date? = nil,
         applicationEnd: Date? = nil,
         parentEventID: UUID? = nil) {
        self.id = id
        self.organizerID = organizerID
        self.title = title
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
        self.location = location
        self.isApplyable = isApplyable
        self.applicationStart = applicationStart
        self.applicationEnd = applicationEnd
        self.parentEventID = parentEventID
    }
    init(dto: EventDownloadDto) {
        self.id = dto.id
        self.organizerID = dto.organizer
        self.title = dto.title
        self.description = dto.description
        self.startDate = Date(timeIntervalSince1970: dto.start_date)
        self.endDate = Date(timeIntervalSince1970: dto.end_date)
        self.location = dto.location
        self.isApplyable = dto.is_applyable
        self.applicationStart = dto.application_start != nil ? Date(timeIntervalSince1970: dto.application_start!) : nil
        self.applicationEnd = dto.application_end != nil ? Date(timeIntervalSince1970: dto.application_end!) : nil
        self.parentEventID = dto.parent_event
    }
}
