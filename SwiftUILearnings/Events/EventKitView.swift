//
//  EventKitView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/09/23.
//

import SwiftUI
import OSLog

struct EventKitView: View {
    @StateObject private var eventManager = EventsManager()
    @State private var isAnyEventPresent = false
    @State private var isAnyReminderPresent = false
    @State private var showEditEventView = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            requestEventAccessButton
            requestReminderAccessButton
            isAnyEventPresentButton
            isAnyReminderPresentButton
            showEditEventViewButton
        }
    }
    
    @ViewBuilder
    private var requestEventAccessButton: some View {
        Button {
            if eventManager.eventsAccessStatus != .authorized {
                eventManager.requestEventAccess { status, error in
                    if let error = error {
                        Logger.eventKit.error("Error occurred while requesting event access : \(error)")
                    } else {
                        Logger.eventKit.info("requestEventAccess result : \(status)")
                    }
                }
            }
        } label: {
            Text("Request Event Access")
        }
        .buttonStyle(.fullWidth)
    }
    
    @ViewBuilder
    private var requestReminderAccessButton: some View {
        Button {
            if eventManager.remindersAccessStatus != .authorized {
                eventManager.requestReminderAccess { status, error in
                    if let error = error {
                        Logger.eventKit.error("Error occurred while requesting reminder access : \(error)")
                    } else {
                        Logger.eventKit.info("requestReminderAccess result : \(status)")
                    }
                }
            }
        } label: {
            Text("Request Reminder Access")
        }
        .buttonStyle(.fullWidth)
    }
    
    @ViewBuilder
    private var isAnyEventPresentButton: some View {
        Button {
            isAnyEventPresent = eventManager.isAnyEventPresent()
        } label: {
            Text("Is any event present?")
                .sheet(isPresented: $isAnyEventPresent, content: {
                    showEvents
                })
        }
        .buttonStyle(.fullWidth)
    }
    
    @ViewBuilder
    private var isAnyReminderPresentButton: some View {
        Button {
            isAnyReminderPresent = eventManager.isAnyReminderPresent()
        } label: {
            Text("Is any reminder present?")
                .alert(Text("Is any reminder present?"), isPresented: $isAnyReminderPresent, actions: {
                    Button("OK", role: .cancel) {
                        isAnyReminderPresent.toggle()
                    }
                })
        }
        .buttonStyle(.fullWidth)
    }
    
    @ViewBuilder
    private var showEditEventViewButton: some View {
        Button {
            showEditEventView.toggle()
        } label: {
            Text("Show edit event view")
        }
        .buttonStyle(.fullWidth)
        .sheet(isPresented: $showEditEventView) {
            EventEditViewRepresentable(eventManager: eventManager)
        }

    }
    
    @ViewBuilder
    private var showEvents: some View {
        VStack {
            Text("Yes, some events are present")
        }
    }
}

//#Preview {
//    EventKitView()
//}
