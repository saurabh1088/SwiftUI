//
//  SFSymbolAnimationTypes.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 29/06/24.
//

import Foundation
import SwiftUI

// TODO: Add unit tests for SFSymbolAnimationType
enum SFSymbolAnimationType: CaseIterable, Equatable {
    case appear
    case bounce
    case disappear
    case pulse
    case replace(Bool)
    case scale
    case variableColor
    
    // Conformance for CaseIterable
    static var allCases: [SFSymbolAnimationType] {
        return [.appear,
                .bounce,
                .disappear,
                .pulse,
                .replace(true),
                .scale,
                .variableColor
                ]
    }
    
    var animationExampleSymbolName: String {
        switch self {
        case .appear:
            return "snowflake.circle.fill"
        case .bounce:
            return "message.badge.filled.fill"
        case .disappear:
            return "snowflake.circle"
        case .pulse:
            return "bonjour"
        case .replace(let value):
            return value ? "figure.walk" : "figure.run"
        case .scale:
            return "message.badge"
        case .variableColor:
            return "touchid"
        }
    }
    
    var title: String {
        switch self {
        case .appear:
            return "Appear"
        case .bounce:
            return "Bounce"
        case .disappear:
            return "Disappear"
        case .pulse:
            return "Pulse"
        case .replace(_):
            return "Replace"
        case .scale:
            return "Scale"
        case .variableColor:
            return "Variable Color"
        }
    }
    
    var animationExampleSymbolColor: Color? {
        switch self {
        case .appear:
            return Color.primaryRed
        case .disappear:
            return Color.primaryGreen
        case .replace:
            return Color.primaryOrange
        default:
            return nil
        }
    }
    
    var symbolSize: CGFloat {
        return 100
    }
}
