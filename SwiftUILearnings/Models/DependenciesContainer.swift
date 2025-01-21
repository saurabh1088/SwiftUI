//
//  DependenciesContainer.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 21/01/25.
//

import Foundation

class DependenciesContainer: ObservableObject {
    let notificationsSetupManager: NotificationsSetupManagerProtocol = NotificationsSetupManager()
}
