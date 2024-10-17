//
//  CameraCaptureView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/10/24.
//

import SwiftUI

// TODO: Refactor this and move into independent files.
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
                .padding()
            } else {
                Button("Take a Photo") {
                    showCamera = true
                }
                .padding()
            }
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image)
        }
        .padding()
    }
    
    private var customText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return "😊 : \(formatter.string(from: Date()))"
    }
    
    func addTextToImage(image: UIImage, text: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)
        return renderer.image { context in
            image.draw(at: CGPoint.zero)
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 60),
                .foregroundColor: UIColor.red
            ]
            let textRect = CGRect(x: 50, y: 50, width: image.size.width, height: image.size.height)
            text.draw(in: textRect, withAttributes: textAttributes)
        }
    }

    // Step 3: Saving the image to the device
    func saveImageToPhotos(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

#Preview {
    CameraCaptureView()
}


struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraView

        init(_ parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
