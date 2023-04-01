//
//
// NotificationsManager.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 31/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        
/**
 User facing notifications play an important role in communicating users of apps important information about
 some events they might be interested in or about some event in the app they might need to know about.
 
 User notifications can be
 - Local Notifications
 - Remote Notifications
 
 `Local Notifications`
 App can generate notifications locally by specifying the content and condition for delivery like time or location which
 will trigger the application.
 
 `Remote Notifications`
 Remote notifications are 
 */
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
