//
//  OSLogViewerModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/08/24.
//

import Foundation
import OSLog

class OSLogViewerModel: ObservableObject {
    @Published private(set) var entries: [String] = []
    
    func extract() {
        do {
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let position = store.position(timeIntervalSinceLatestBoot: 1)
            entries = try store
                .getEntries(at: position)
                .compactMap { $0 as? OSLogEntryLog }
                .filter { $0.subsystem == Bundle.main.bundleIdentifier! }
                .map { "[\($0.date.formatted())] [\($0.category)] \($0.composedMessage)" }
        } catch(let error) {
            Logger.oslog.error("Error occurred while extracting logs using OSLogStore : \(error.localizedDescription)")
        }
    }
}
