//
//  SwiftUILearningsWidgetLiveActivity.swift
//  SwiftUILearningsWidget
//
//  Created by Saurabh Verma on 30/09/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftUILearningsWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftUILearningsWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftUILearningsWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwiftUILearningsWidgetAttributes {
    fileprivate static var preview: SwiftUILearningsWidgetAttributes {
        SwiftUILearningsWidgetAttributes(name: "World")
    }
}

extension SwiftUILearningsWidgetAttributes.ContentState {
    fileprivate static var smiley: SwiftUILearningsWidgetAttributes.ContentState {
        SwiftUILearningsWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwiftUILearningsWidgetAttributes.ContentState {
         SwiftUILearningsWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftUILearningsWidgetAttributes.preview) {
   SwiftUILearningsWidgetLiveActivity()
} contentStates: {
    SwiftUILearningsWidgetAttributes.ContentState.smiley
    SwiftUILearningsWidgetAttributes.ContentState.starEyes
}
