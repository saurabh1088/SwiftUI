//
//
// NotificationsManager.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 31/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

// TODO: Check PushKit Framework
// https://developer.apple.com/documentation/pushkit

        
/**
 User facing notifications play an important role in communicating users of apps important information about
 some events they might be interested in or about some event in the app they might need to know about.
 
 User notifications can be
 - Local Notifications
 - Remote Notifications
 
 `Local Notifications`
 App can generate notifications locally by specifying the content and condition for delivery like time or location which
 will trigger the application.
 User can change authorization status anytime so before scheduling a local notification one should always check
 the status.
 
 `Remote Notifications`
 Remote notifications are 
 */
import Foundation
import UserNotifications

class NotificationsManager: NSObject {
    static let shared = NotificationsManager()
    private override init() {}
    
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
    ///
    /// `Request authorization in a relevant context`
    /// It's not necessary or desirable to request for authorization on app launch itself. This ideally should be
    /// asked within some relvant context so as to give user more insight of what notification will be like. For
    /// e.g. suppose a grocery app let's you add some available coupon codes, so when user adds a coupon that
    /// time request can be made telling user that app can notify for coupons when available. This way user will
    /// get an understanding of why and how the notification can be helpful to him/her and can take informed
    /// decision.
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
    }
    
    /// This code will request for a provisional permission for notifications. When used this is not going to show
    /// any alert asking for authorization. In fact authorization is granted by default with status maintaied as
    /// provisional unless user keeps or turns off the notification.
    /// When provisional authorization is requested, one can also request for authorization when app launches
    /// first time. The user is only asked his/her preference only when actual notification is received.
    func requestProvisionalPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .provisional]) { granted, error in
            print("Provisional permission granted: \(granted)")
        }
    }
    
    /// Schedules a local notification for the app after 10 seconds. Authorization for notification is still required
    /// as local notifications are also same as remote ones just these are generated and trigerred locally rather
    /// than from remote server.
    func scheduleLocalNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "A local notification example"
        notificationContent.subtitle = "This is a local notification and an app can configure locally to send it."
        notificationContent.sound = .default
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString,
                                                        content: notificationContent,
                                                        trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
    
    /// To create an actionable notification one needs to create an action using `UNNotificationAction`
    /// which then needs to be added to a category defined by `UNNotificationCategory`. This category
    /// then needs to be registered with the system using `UNUserNotificationCenter`
    func scheduleActionableLocalNotification() {
        let goodAction = UNNotificationAction(identifier: "actionableLocalNotification.goodAction", title: "Good")
        let badAction = UNNotificationAction(identifier: "actionableLocalNotification.badAction", title: "Bad")
        let actionableLocalNotificationCategory = UNNotificationCategory(identifier: "actionableLocalNotificationCategory",
                                                                         actions: [goodAction, badAction],
                                                                         intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([actionableLocalNotificationCategory])
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "An actionable local notification"
        notificationContent.subtitle = "This is example of an actionable local notification. We simply ask user how's user feeling, Good or Bad"
        notificationContent.categoryIdentifier = "actionableLocalNotificationCategory"
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString,
                                                        content: notificationContent,
                                                        trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(notificationRequest)
    }
}

extension NotificationsManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Notification center did receive response : \(response.actionIdentifier)")
        if response.actionIdentifier == "actionableLocalNotification.goodAction" {
            print("Selection was Good")
        }
        completionHandler()
    }
}
