//
//  EventKitView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/09/23.
//

import SwiftUI

struct EventKitView: View {
    @StateObject private var eventManager = EventsManager()
    
    var body: some View {
        VStack(spacing: 16.0) {
            Button {
                if eventManager.eventsAccessStatus != .authorized {
                    eventManager.requestEventAccess { status, error in
                        print("Status :: \(status)")
                    }
                }
            } label: {
                Text("Request Event Access")
            }
            
            Button {
                if eventManager.remindersAccessStatus != .authorized {
                    eventManager.requestReminderAccess { status, error in
                        print("Status :: \(status)")
                    }
                }
            } label: {
                Text("Request Reminder Access")
            }
        }
        .onAppear {
            print("eventsAccessStatus :: \(eventManager.eventsAccessStatus)")
            print("remindersAccessStatus :: \(eventManager.remindersAccessStatus)")
        }
    }
    
}


//#Preview {
//    EventKitView()
//}
