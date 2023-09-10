//
//
// ViewBuilderMaxLimitView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

/// In SwiftUI `ViewBuilder` attribute is used for child view producing closure parameters. In `ViewBuilderMaxLimitView`
/// example is provided using a `VStack` One can add multiple views in `VStack` however as `VStack`
/// takes these input content in a closure attributed with `ViewBuilder` the maximum is limited to 10. Uncommenting
/// the following will cause compiler to cry with error : `Extra argument in call`
/// ```Text("Eleven")```
///
/// This happens as `ViewBuilder` provides various content builder static methods with maximum arguments
/// restricted to 10
/// ```
/// static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(
/// _ c0: C0,
/// _ c1: C1,
/// _ c2: C2,
/// _ c3: C3,
/// _ c4: C4,
/// _ c5: C5,
/// _ c6: C6,
/// _ c7: C7,
/// _ c8: C8,
/// _ c9: C9
/// ) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View
/// ```
struct ViewBuilderMaxLimitView: View {
    var body: some View {
        VStack {
            Text("One")
            Text("Two")
            Text("Three")
            Text("Four")
            Text("Five")
            Text("Six")
            Text("Seven")
            Text("Eight")
            Text("Nine")
            Text("Ten")
            
            /*
            Text("Eleven")
            */
        }
    }
}

struct ViewBuilderMaxLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderMaxLimitView()
    }
}
