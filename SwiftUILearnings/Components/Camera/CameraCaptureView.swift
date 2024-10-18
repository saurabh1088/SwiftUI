//
//  CameraCaptureView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/10/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct CameraCaptureView: View {
    @State private var image: UIImage?
    @State private var showCamera = false
        
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Button("Add Text & Save") {
                    let editedImage = addTextToImage(image: image, text: customText)
                    saveImageToPhotos(image: editedImage)
                }
                .buttonStyle(.fullScreenWide)
                
            } else {
                Button("Take a Photo") {
                    showCamera = true
                }
                .buttonStyle(.fullScreenWide)
            }
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image)
        }
        .padding()
    }
    
    private var customText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd, yyyy h:mm a"
        return "😊 : \(formatter.string(from: Date()))"
    }
    
    func addTextToImage(image: UIImage, text: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)
        return renderer.image { context in
            image.draw(at: CGPoint.zero)
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 128),
                .foregroundColor: UIColor.red
            ]
            let textRect = CGRect(x: 50, y: 50, width: image.size.width, height: image.size.height)
            text.draw(in: textRect, withAttributes: textAttributes)
        }
    }

    func saveImageToPhotos(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

#Preview {
    CameraCaptureView()
}
