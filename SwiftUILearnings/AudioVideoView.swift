//
//
// AudioVideoView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 11/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import AVKit

struct AudioVideoView: View {
    @State private var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: player)
            .frame(height: 300)
            .onAppear {
                player = AVPlayer(url: URL(string: "http://localhost:8080/sample.mp4")!)
            }
    }
}

struct AudioVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AudioVideoView()
    }
}

