//
//
// CustomButtonStyles.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 14/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import SwiftUI

struct FullWidthButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(20)
            .foregroundColor(Color.primaryVeryDarkBlue)
            .background(Color.primaryRed)
    }
}

/// Below extension help to achieve `Static member lookup in Generic contexts`. This means
/// if this extension wasn't defined then to use this button style one needs to use it like below :

/**
 Below extension help to achieve `Static member lookup in Generic contexts`. This means if this
 extension wasn't defined then to use this button style one needs to use it like below :
 
 ```
 Button {
     NotificationsManager.shared.scheduleLocalNotification()
 } label: {
     Text("Schedule local notification")
 }
 .buttonStyle(FullWidthButton())
 ```
 
 This is fine, but it would have been have been great if we could have just been able to provide styles like the default
 styles available out of the box from SwiftUI framework i.e.
 ```.buttonStyle(.bordered)```
 
 Below extension on `ButtonStyle` achieves that by defining a static property and initialising it to the custom
 style declared. This way the declared static var can be utilized as a dot notation in .buttonStyle modifier with
 Xcode's autocompletion feature also suggesting it as a type, so ine gets a full list of available styles which can be
 applied to buttons which comprises all default coming out of the box and ones declared custom.
 This improves discoverability and also helps anyone applying custom styles to know what all types are available.
 */
extension ButtonStyle where Self == FullWidthButton {
    static var fullWidth: FullWidthButton { .init() }
}
