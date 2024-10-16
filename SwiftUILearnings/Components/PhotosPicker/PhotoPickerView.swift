//
//  PhotoPickerView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 16/10/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedPhotos = [Image]()
    
    var body: some View {
        VStack {
            
            ForEach(0..<selectedPhotos.count, id: \.self) { index in
                selectedPhotos[index]
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            PhotosPicker(selection: $selectedItems, matching: .images, preferredItemEncoding: .automatic) {
                Text("Select Multiple Photos")
            }
        }
        .onChange(of: selectedItems) { newValue in
            Task {
                selectedPhotos.removeAll()
                for item in selectedItems {
                    if let image = try? await item.loadTransferable(type: Image.self) {
                        selectedPhotos.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
