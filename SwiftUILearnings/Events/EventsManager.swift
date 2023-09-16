//
//  EventsManager.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/09/23.
//

import OSLog
import EventKit
import Foundation

/// `EventKit` is framework provided by Apple for helping apps in cases where requirement is to :
/// - Create
/// - View
/// - Edit
/// a Calendar OR Reminder Event
///
/// Using `EventKit` framework one can get access to calendar and reminders data. This data can be retrieved
/// to view or edit, or one can also add events to calendar or reminders as per apps requirements.
class EventsManager: ObservableObject {
    
    /// `EKEventStore` is the point of contact for the app which wants to access calendat or reminders data.
    /// So here our SwiftUILearnings app needs to request calendat and reminders data and for that purpose
    /// it needs to contact `EKEventStore`
    var eventStore: EKEventStore = EKEventStore()
    
    /// `EKAuthorizationStatus` represents the current authorization status for the app.
    var eventsAccessStatus: EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .event)
    }
    
    func requestEventAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }
    
    func isAnyEventPresent() -> Bool {
        let eventPredicate = eventStore.predicateForEvents(withStart: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                                                      end: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
                                                      calendars: nil)
        return !eventStore.events(matching: eventPredicate).isEmpty
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) -> EKEvent {
        let event = EKEvent(eventStore: eventStore)
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
        @unknown default:
            fatalError()
        }
    }
}

// MARK: EventsManager extension - Reminders
extension EventsManager {
    
    var remindersAccessStatus: EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .reminder)
    }
    
    func requestReminderAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: EKEntityType.reminder) { (accessGranted, error) in
            completion(accessGranted, error)
        }
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
}
