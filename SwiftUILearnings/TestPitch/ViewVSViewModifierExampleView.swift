//
//  ViewVSViewModifierExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 10/08/24.
//

import SwiftUI

/**
 Here a scenario is explored where-in same view hierarchy and output is achived using only views and then by
 defining a view modifier. The aim was to see how these two approaches are same or different and which one to
 follow
 
 Using view composition the code comes like:
 
 ```
 HorizontallyDividedView {
     leftView
 } rightContent: {
     rightView
 }
 ```
 
 While using the view modifier approach the code looks like below:
 
 ```
 leftView
     .divideHorizontallyWith {
         rightView
     }
 ```
 
 End result comes same, it all boils down to preference. In above example the first approach may appear more
 self-explanatory as to what the final view-hierarchy will come to be, while in view modifier approach as the modifier
 is applied to a view along with passing another view, it comes down to naming of the modifier as well as the passed
 views else it could be difficult to comprehend what the modifier is doing.
 */
struct ViewVSViewModifierExampleView: View {
    
    var body: some View {
        Group {
            Section {
                HorizontallyDividedView {
                    leftView
                } rightContent: {
                    rightView
                }
            } header: {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Using Views")
                    Spacer()
                }
                .padding()
                .background(Color.primaryOrange)
            } footer: {
                Divider()
            }
            
            Section {
                leftView
                    .divideHorizontallyWith {
                        rightView
                    }
            } header: {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Using view modifier")
                    Spacer()
                }
                .padding()
                .background(Color.primaryOrange)
            } footer: {
                Divider()
            }
        }
        .padding()
    }
    
    @ViewBuilder private var leftView: some View {
        Text("👈")
            .font(.system(size: 80))
    }
    
    @ViewBuilder private var rightView: some View {
        Text("👉")
            .font(.system(size: 80))
    }
}

#Preview {
    ViewVSViewModifierExampleView()
}
