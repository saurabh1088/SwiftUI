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
    
    var pdfDocument: PDFDocument {
        return PDFDocument(url: NSURL(string: "http://localhost:8080/0973_001.pdf")! as URL)!
    }
    
    var body: some View {
        VStack {
            PDFFilesView(showing: pdfDocument)
        }
    }
}

struct PDFDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        PDFDocumentView()
    }
}
