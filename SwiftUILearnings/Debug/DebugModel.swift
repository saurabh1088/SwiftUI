//
//  DebugModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/05/24.
//

import Foundation

protocol Debuggable {
    var id: Int { get }
    var value: String { get }
}

struct DebugModel: Debuggable {
    let id: Int
    let value: String
}

extension DebugModel: CustomStringConvertible {
    var description: String {
        return  """
                This is a debug model, used for exploring lldb debugging commands.
                - Identifier : \(id)
                - Value : \(value)
                """
    }
}

struct DebugModelWithNoCustomStringConvertible {
    let id: Int
    let value: String
    let level: String
    let issue: String
}
