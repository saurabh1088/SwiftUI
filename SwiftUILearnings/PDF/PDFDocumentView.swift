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
    @State private var searchText = String()
    
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
        .searchable(text: $searchText)
        .onSubmit(of: .search, {
            print("Searched :: \(searchText)")
            viewModel.pdfDocument?.findString(searchText)
        })
        .navigationTitle(SwiftUI.Text(LearningTopics.pdfFiles.rawValue))
        .task {
            viewModel.loadPDFDocument()
        }
        .onReceive(viewModel.$pdfDocumentDidLoad) { value in
            if value {
                viewModel.setDelegate()
            }
        }
    }
}

struct PDFDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        let fileURLString = "https://sample-videos.com/pdf/Sample-pdf-5mb.pdf"
        PDFDocumentView(viewModel: PDFDocumentViewModel(fileURLString: fileURLString))
    }
}
