//
//  EventsManager.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/09/23.
//

import EventKit
import Foundation

class EventsManager: ObservableObject {
    
    private var eventStore: EKEventStore = EKEventStore()
    
    var eventsAccessStatus: EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .event)
    }
    
    var remindersAccessStatus: EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .reminder)
    }
    
    func requestEventAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }
    
    func requestReminderAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: EKEntityType.reminder) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }
}
