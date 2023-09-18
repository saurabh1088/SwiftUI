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
    @State private var showAddEventAlert = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            addEventToCalendarButton
            showEventsAddedToCalendar
            isAnyReminderPresentButton
        }
    }
    
    @ViewBuilder
    private var addEventToCalendarButton: some View {
        Button {
            eventManager.addEventToCalendar()
        } label: {
            Text("Add event to calendar")
        }
        .buttonStyle(.fullWidth)
        .sheet(isPresented: $showEditEventView) {
            EventEditViewRepresentable(eventManager: eventManager)
        }
        .alert(eventManager.addEventToCalendarStatus.alertTitle, isPresented: $showAddEventAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(eventManager.addEventToCalendarStatus.alertMessage)
        })
        .onChange(of: eventManager.addEventToCalendarStatus) { newValue in
            if newValue == .success {
                showEditEventView.toggle()
            } else {
                showAddEventAlert.toggle()
            }
        }

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
    private var showEventsAddedToCalendar: some View {
        Button {
            isAnyEventPresent = eventManager.isAnyEventPresent()
        } label: {
            Text("Events in 🗓️")
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
    private var showEvents: some View {
        VStack {
            ForEach(eventManager.allEventsInRange(), id: \.self) { event in
                HStack(alignment: .top, spacing: 20) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.primaryRed)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.system(size: 30))
                        Text(event.startDateString)
                            .font(.system(size: 20))
                        Text(event.endDateString)
                            .font(.system(size: 20))
                    }
                }
                .padding(20)
                .frame(width: UIScreen.main.bounds.size.width - 32)
                .background(Color.primaryYellow)
            }
        }
    }
}

//#Preview {
//    EventKitView()
//}
