//
//
// NotificationsView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 01/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import SwiftUIViewsHelper

struct NotificationsView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button {
                NotificationsManager.shared.scheduleLocalNotification()
            } label: {
                Text("Schedule local notification")
            }
            .buttonStyle(.fullScreenWide)
            
            Button {
                NotificationsManager.shared.scheduleActionableLocalNotification()
            } label: {
                Text("Schedule actionable local notification")
            }
            .buttonStyle(.fullScreenWide)
        }
        .navigationTitle(Text(LearningTopics.notifications.rawValue))
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
