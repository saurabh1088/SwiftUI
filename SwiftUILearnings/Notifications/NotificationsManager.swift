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
    
    /// User might consider notifications disruptive, so an app if wants to send notifications it needs to first obtain
    /// permission from user to send those. Permissoin is obtained from `UNUserNotificationCenter` method
    /// `requestAuthorization(options:completionHandler:)`
    /// First time this authorization request is made system will show alert with verbiage to ask user for permission,
    /// once permission is granted or denied subsequent call to this won't ask again, unless app ie deleted and
    /// installed again.
    ///
    /// `Provisional authorization vs explicit`
    /// - In explicit authorization user must decide whether to accept or deny the request, this without even seeing
    /// the actual notification, so user may not have complete context how a notification looks for the app and if
    /// that could be useful or not.
    /// - In provisional authorization notifications are sent on a trial basis. User can then evaluate and decide
    /// if they want to accept or deny those.
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
    }
}
