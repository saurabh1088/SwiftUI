//
//
// DataEssentialView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 16/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct DataEssentialView: View {
    
    /// `What is StateObject and when to use it?`
    ///
    /// `StateObject` by definition is a property wrapper which when used, instantiates an observable object.
    /// One uses a `StateObject` when requirement is to create a reference type single source of truth to store
    /// for a view hierarchy.
    /// Apple recommends declaring `StateObject` as private to prevent setting these from initialisers.
    ///
    /// `When and how many times is StateObject created?`
    ///
    /// SwiftUI framework will create a new instance of `StateObject` model object only ONCE for the
    /// lifetime of the parent view declaring it. Even if the parent view's inputs changes SwiftUI won't create
    /// a new instance of `StateObject`. Only once the IDENTITY of the parent view declaring `StateObject`
    /// changes then new instance will be created.
    ///
    /// `How to share StateObject further to view hierarchy`
    ///
    /// `StateObject` can be shared by `EnvironmentObject` or by passing it through property having
    /// `ObservedObject` attribute.
    ///
    /// `Can we initialize StateObject using external data?`
    ///
    /// `StateObject` has below initializer which SwiftUI calls at appropriate time.
    /// `init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType)`
    /// As per Apple's recommendation itself one shoudn't call this initializer directly.
    /// There is no restriction however to call this if required BUT, Apple's documentation cautions doing this
    /// as SwiftUI will only initialize object once for the lifetime of the view even if `StateObject` initializer
    /// is called more than once. This might cause unexpected behaviour.
    /// (source : https://developer.apple.com/documentation/swiftui/stateobject)
    ///
    /// `dataEssentialStateObject` in `DataEssentialView` is marked as `@StateObject`
    /// and then passed to child views as `@ObservedObject`. Any change to published proprties of `dataEssentialStateObject`
    /// should cause entire view hierarchy to update.
    @StateObject private var dataEssentialStateObject = DataEssentialStateObject()
    
    @State private var viewColor: Color = Color.white
    @State private var showSecondaryLevel: Bool = false
    @State private var showExternalStateObjectView: Bool = false
    
    var body: some View {
        VStack {
            
            VStack {
                Text("😜")
                    .padding(40)
            }
            .background(viewColor)
            
            HStack {
                
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        Button {
                            viewColor = .red
                        } label: {
                            Text("Red")
                        }
                        
                        Button {
                            viewColor = .green
                        } label: {
                            Text("Green")
                        }
                    }
                    
                    Button {
                        dataEssentialStateObject.themeColor = .yellow
                    } label: {
                        Text("Change theme")
                    }
                    
                    Button {
                        showSecondaryLevel = true
                    } label: {
                        Text("Next Level")
                    }
                    
                    Button {
                        showExternalStateObjectView.toggle()
                    } label: {
                        Text("Test Init View")
                    }

                }
            }
            
            // Case 1: showExternalStateObjectView is false
            // When showExternalStateObjectView is false no matter how many times
            // body is called as this view isn't required in view hierarchy it won't
            // get initialised.
            //
            // Case 2: showExternalStateObjectView is true
            // When showExternalStateObjectView becomes true DataEssentialTestInitView
            // is required so it get's initialised and it's @StateObject is also
            // initialised. Now with showExternalStateObjectView as true if this body
            // is called again then DataEssentialTestInitView will get initialised
            // everytime it's parent's body gets called. But in all those instances
            // it's @StateObject won't be initialised again.
            //
            // Case 3: showExternalStateObjectView was set true then false then true
            // When showExternalStateObjectView is set to true once again from false
            // then view as well as @StateObject are initialised again.
            if showExternalStateObjectView {
                DataEssentialTestInitView(themeColor: dataEssentialStateObject.themeColor)
            }

        }
        .navigationTitle(Text("Data Essential View"))
        .navigationDestination(isPresented: $showSecondaryLevel, destination: {
            DataEssentialSecondaryLevelView(dataEssentialViewModel: dataEssentialStateObject)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataEssentialStateObject.themeColor)
    }
}

struct DataEssentialView_Previews: PreviewProvider {
    static var previews: some View {
        DataEssentialView()
    }
}

struct DataEssentialSecondaryLevelView: View {
    
    @ObservedObject var dataEssentialViewModel: DataEssentialStateObject
    @State private var showTertiaryLevel: Bool = false
    // This property is to test what happens when view's ObservedObject's published
    // property gets updated from somewhere else in hierarchy (this could be parent view
    // or some child view if this ObserverObject is further passed along)
    @State private var stateCounter: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                dataEssentialViewModel.themeColor = .orange
            } label: {
                Text("Change theme")
            }
            
            Button {
                showTertiaryLevel = true
            } label: {
                Text("Next Level")
            }
            
            Text("State : \(stateCounter)")
            
            Button {
                stateCounter += 1
            } label: {
                Text("Change local state")
            }

        }
        .navigationTitle(Text("Secondary Level View"))
        .navigationDestination(isPresented: $showTertiaryLevel, destination: {
            DataEssentialTertiaryLevelView(dataEssentialViewModel: dataEssentialViewModel)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataEssentialViewModel.themeColor)
    }
}

struct DataEssentialTertiaryLevelView: View {
    
    @ObservedObject var dataEssentialViewModel: DataEssentialStateObject
    @EnvironmentObject var appStateObject: AppStateObjectModel
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                dataEssentialViewModel.themeColor = .orange
            } label: {
                Text("Change theme")
            }
            
            Button {
                appStateObject.navigationPath = .init()
            } label: {
                Text("Pop to root")
            }
        }
        .navigationTitle(Text("Tertiary Level View"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataEssentialViewModel.themeColor)
    }
}

struct DataEssentialTestInitView: View {
    
    @StateObject private var dataEssentialExternalInit: ExternalInitStateObject
    @State private var animate: Bool = false
    
    init(themeColor: Color) {
        print("Calling init for view DataEssentialTestInitView")
        _dataEssentialExternalInit = StateObject(wrappedValue: ExternalInitStateObject(themeColor: themeColor))
        print("Completed init for view DataEssentialTestInitView")
    }
    
    var body: some View {
        VStack {
            Text("🤡")
                .font(.system(size: animate ? 100 : 24))
            
            Spacer()
            
            Button {
                animate.toggle()
            } label: {
                Text("Click Me")
            }

        }
        .padding()
        .animation(.easeIn, value: animate)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataEssentialExternalInit.themeColor)
    }
}
