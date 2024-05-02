//
//  DebugModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/05/24.
//

import Foundation

protocol Debugable {
    var id: Int { get }
    var value: String { get }
}

struct DebugModel: Debugable {
    let id: Int
    let value: String
}

extension DebugModel: CustomStringConvertible {
    var description: String {
        return "\(id) \(value)"
    }
}
