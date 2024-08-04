//
//  View+Extension.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/08/24.
//

import Foundation
import SwiftUI

extension View {
    func logsViewer() -> some View {
        modifier(OSLogView())
    }
}
