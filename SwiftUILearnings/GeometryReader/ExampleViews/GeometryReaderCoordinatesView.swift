//
//  GeometryReaderCoordinatesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 28/07/24.
//

import SwiftUI

/// GeometryReader after all is a view as most of things are in SwiftUI
/// As per official documentation definition itself GeometryReader is :
///
/// A container view that defines its content as a function of its own size and coordinate space.
/// https://developer.apple.com/documentation/swiftui/geometryreader
///
/// GeometryReader causes entire view to fill the whole screen and change the coordinate system.
/// GeometryReader fills into its parent container with a default alignment of the content as topLeading.
/// In the example below one can see for view `viewWrappedInGeometryReader` GeometryReader fills up the
/// entire screen and the width, height label/value views get alligned to top left corner unlikey to center alignment in `viewWithoutGeometryReader`
struct GeometryReaderCoordinatesView: View {
    @State private var useGeometry: Bool = false
    
    private var geometryStatus: String {
        return useGeometry ? "On" : "Off"
    }
    
    var body: some View {
        VStack {
            if useGeometry {
                viewWrappedInGeometryReader
            } else {
                viewWithoutGeometryReader
            }
            
            Button {
                useGeometry.toggle()
            } label: {
                Text("Geometry \(geometryStatus)")
            }

        }
        .navigationTitle("Geometry Reader")
    }
    
    @ViewBuilder
    private var viewWrappedInGeometryReader: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Width")
                    Text("\(geometry.size.width)")
                }
                HStack {
                    Text("Height")
                    Text("\(geometry.size.height)")
                }
            }
        }
        .background(Color.red)
    }
    
    @ViewBuilder
    private var viewWithoutGeometryReader: some View {
        VStack {
            HStack {
                Text("Width")
                Text("\(UIScreen.main.bounds.size.width)")
            }
            HStack {
                Text("Height")
                Text("\(UIScreen.main.bounds.size.height)")
            }
        }
        .background(Color.red)
    }
}

#Preview {
    GeometryReaderCoordinatesView()
}
