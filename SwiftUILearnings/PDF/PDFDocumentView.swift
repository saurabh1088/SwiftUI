//
//
// PDFView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 27/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import PDFKit

struct PDFDocumentView: View {
    @ObservedObject var viewModel: PDFDocumentViewModel
    
    var body: some View {
        VStack {
            if viewModel.pdfDocumentDidLoad,
               let pdfDocument = viewModel.pdfDocument {
                PDFFilesView(showing: pdfDocument)
            } else {
                ProgressView {
                    Text("Loading...")
                }
            }
        }
        .navigationTitle(SwiftUI.Text(LearningTopics.pdfFiles.rawValue))
        .task {
            viewModel.loadPDFDocument()
        }
    }
}

struct PDFDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        let fileURLString = "https://sample-videos.com/pdf/Sample-pdf-5mb.pdf"
        PDFDocumentView(viewModel: PDFDocumentViewModel(fileURLString: fileURLString))
    }
}
