//
//  SwiftUILearningsApp.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/03/23.
//  Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import SwiftUI

/// @main here is an attribute. Source : https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes
/// Attributes gives us some additional information for the type or declarations on which those are applied.
/// Some declaration attributes can also accespt arguments.
///
/// For e.g. @available attribute
/// ```
/// @available(iOS 14, *)
/// ```
///
/// @main here indicates that `SwiftUILearningsApp` is the entry point of the application. When @main
/// attribute is used on a struct, class or enum then that struct, class or enum is expected to provide a main
/// type function having no arguments and returning void
/// ```
/// static func main() { }
/// ```
/// Now but there isn't any main function defined anywhere in `SwiftUILearningsApp` at all so how does
/// it works. Well this works because of conformance to protocol `App`. A default implementation has been added
/// via a protocol extension to protocol `App`, hence to declare main function is no longer required.
/// The default implementation as per protocol extension implementation will take care of launching app in platform
/// appropriate way.
/// If however a main method is implemented in `SwiftUILearningsApp` then that method gets called and
/// app will fail to launch as there is no way to call default implementation from within custom implementation.
/// (NOTE : Explore this point of overriding main method implementation)
@main
struct SwiftUILearningsApp: App {
    // TODO: Add comments and documentation for scene phase
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        UNUserNotificationCenter.current().delegate = NotificationsManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App lifecycle : Background")
            case .inactive:
                print("App lifecycle : Inactive")
            case .active:
                print("App lifecycle : Active")
            @unknown default:
                print("App lifecycle : Unknown")
            }
        }
    }
}
