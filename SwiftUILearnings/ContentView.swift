//
//  ContentView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/03/23.
//  Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Here if these NavigationLink's aren't put inside VStack and are
            // directly inside NavigationView then only one will show up.
            VStack {
                NavigationLink("Geometry Reader", destination: BasicGeometryReaderView())
                NavigationLink("Web Content Technologies", destination: BasicWebContentTechnologiesView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
