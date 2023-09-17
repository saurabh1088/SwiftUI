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
    
    @Published var addEventToCalendarStatus: AddEventToCalendarStatus = .none
    
    /// `EKEventStore` is the point of contact for the app which wants to access calendat or reminders data.
    /// So here our SwiftUILearnings app needs to request calendat and reminders data and for that purpose
    /// it needs to contact `EKEventStore`
    var eventStore: EKEventStore = EKEventStore()
    
    /// `EKAuthorizationStatus` represents the current authorization status for the app.
    var eventsAccessStatus: EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .event)
    }
    
    func canAddEventsToCalendar() -> Bool {
        var canAddToCalendar = false
        switch eventsAccessStatus {
        case .notDetermined:
            requestEventAccess { status, error in
                if let error = error {
                    Logger.eventKit.error("Error occurred while requesting event access : \(error)")
                    canAddToCalendar = false
                } else {
                    Logger.eventKit.info("requestEventAccess result : \(status)")
                    canAddToCalendar = true
                }
            }
            return canAddToCalendar
        case .restricted:
            return canAddToCalendar
        case .denied:
            return canAddToCalendar
        case .authorized:
            return canAddToCalendar
        @unknown default:
            return canAddToCalendar
        }
    }
    
    func requestEventAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        if eventsAccessStatus != .authorized {
            eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
                completion(accessGranted, error)
            }
        }
    }
    
    func isAnyEventPresent() -> Bool {
        switch eventsAccessStatus {
        case .notDetermined:
            return false
        case .restricted:
            return false
        case .denied:
            return false
        case .authorized:
            let eventPredicate = eventStore.predicateForEvents(withStart: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                                                          end: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
                                                          calendars: nil)
            return !eventStore.events(matching: eventPredicate).isEmpty
        @unknown default:
            return false
        }
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) -> EKEvent {
        let event = EKEvent(eventStore: eventStore)
        event.calendar = eventStore.defaultCalendarForNewEvents
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        return event
    }
    
    func addEventToCalendar() {
        switch eventsAccessStatus {
        case .notDetermined:
            requestEventAccess { status, error in
                if let error = error {
                    Logger.eventKit.error("Error occurred while requesting event access : \(error)")
                    self.addEventToCalendarStatus = .accessAttemptFailed
                } else {
                    Logger.eventKit.info("requestEventAccess result : \(status)")
                }
            }
        case .restricted:
            addEventToCalendarStatus = .accessRestricted
        case .denied:
            addEventToCalendarStatus = .accessDenied
        case .authorized:
            addEventToCalendarStatus = .success
        @unknown default:
            fatalError()
        }
    }
    
    func addToCalendar(event: EKEvent) {
        switch eventsAccessStatus {
        case .notDetermined:
            Logger.eventKit.info("eventsAccessStatus is notDetermined. Requesting user for access")
            requestEventAccess { status, error in
                if let error = error {
                    Logger.eventKit.error("Error occurred while requesting event access : \(error)")
                } else {
                    Logger.eventKit.info("requestEventAccess result : \(status)")
                    self.addToCalendar(event: event)
                }
            }
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

enum AddEventToCalendarStatus {
    case accessRestricted
    case accessDenied
    case accessAttemptFailed
    case none
    case success
    
    var alertMessage: String {
        switch self {
        case .accessRestricted:
            return "SwiftUILearnings is restricted to access calendar"
        case .accessDenied:
            return "SwiftUILearnings is denied access to calendar"
        case .accessAttemptFailed:
            return "SwiftUILearnings tried requesting access to calendar but attempt failed"
        case .success:
            return "SwiftUILearnings successfully requested access"
        case .none:
            return String()
        }
    }
    
    var alertTitle: String { "Add event to calendar" }
}
