//
//  EventsManager.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/09/23.
//

import OSLog
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
    
    func isAnyEventPresent() -> Bool {
        let eventPredicate = eventStore.predicateForEvents(withStart: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                                                      end: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
                                                      calendars: nil)
        return !eventStore.events(matching: eventPredicate).isEmpty
    }
    
    func isAnyReminderPresent() -> Bool {
        var isAnyReminderPresent = false
        if let calendar = eventStore.defaultCalendarForNewReminders() {
            let reminderPredicate = eventStore.predicateForReminders(in: [calendar])
            eventStore.fetchReminders(matching: reminderPredicate) { reminders in
                guard let reminders = reminders else { return }
                isAnyReminderPresent = !reminders.isEmpty
            }
        }
        return isAnyReminderPresent
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) -> EKEvent {
        var event = EKEvent(eventStore: eventStore)
        event.calendar = eventStore.defaultCalendarForNewEvents
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        return event
    }
    
    func addToCalendar(event: EKEvent) {
        switch eventsAccessStatus {
        case .notDetermined:
            Logger.eventKit.info("eventsAccessStatus is notDetermined can't add event to calendar")
        case .restricted:
            Logger.eventKit.info("eventsAccessStatus is restricted can't add event to calendar")
        case .denied:
            Logger.eventKit.info("eventsAccessStatus is denied can't add event to calendar")
        case .authorized:
            do {
                try eventStore.save(event, span: .thisEvent)
            } catch {
                Logger.eventKit.error("Error occurred while saving event to eventStore")
            }
            
        }
    }
    
}
