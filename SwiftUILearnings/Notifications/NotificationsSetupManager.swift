//
//  NotificationsSetupManager.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 21/01/25.
//

import Foundation
import UserNotifications

protocol NotificationsSetupManagerProtocol {
    func setupNotifications()
}

class NotificationsSetupManager: NotificationsSetupManagerProtocol {
    func setupNotifications() {
        let category = UNNotificationCategory(identifier: "notificationExtensionCategory",
                                             actions: [],
                                             intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        NotificationsManager.shared.requestPermission()
    }
}
