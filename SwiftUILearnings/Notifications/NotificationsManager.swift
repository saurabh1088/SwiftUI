//
//
// NotificationsManager.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 31/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import UserNotifications

class NotificationsManager {
    static let shared = NotificationsManager()
    private init() {}
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
    }
}
