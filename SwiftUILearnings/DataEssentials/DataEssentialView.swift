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
    @StateObject private var dataEssentialStateObject = DataEssentialStateObject()
    
    @State private var viewColor: Color = Color.white
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Choose a color")
                    .padding(40)
            }
            .background(viewColor)
            
            HStack {
                
                VStack {
                    HStack {
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
                }
            }

        }
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
    
    var body: some View {
        VStack {
            Button {
                dataEssentialViewModel.themeColor = .orange
            } label: {
                Text("Change theme")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataEssentialViewModel.themeColor)
    }
}
