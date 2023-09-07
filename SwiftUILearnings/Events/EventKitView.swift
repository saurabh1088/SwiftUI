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
    
    var body: some View {
        VStack(spacing: 16.0) {
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
            
            Button {
                isAnyEventPresent = eventManager.isAnyEventPresent()
            } label: {
                Text("Is any event present?")
                    .alert(Text("Is any event present?"), isPresented: $isAnyEventPresent, actions: {
                        Button("OK", role: .cancel) {
                            isAnyEventPresent.toggle()
                        }
                    })
            }
            
            
            Button {
                isAnyReminderPresent = eventManager.isAnyReminderPresent()
            } label: {
                Text("Is any reminder present?")
                    .alert(Text("Is any reminder present?"), isPresented: $isAnyEventPresent, actions: {
                        Button("OK", role: .cancel) {
                            isAnyReminderPresent.toggle()
                        }
                    })
            }

        }
    }
    
}


//#Preview {
//    EventKitView()
//}
