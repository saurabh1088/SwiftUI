//
//  PDFDocumentViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 19/05/24.
//

import Foundation
import PDFKit

// https://sample-videos.com/pdf/Sample-pdf-5mb.pdf
final class PDFDocumentViewModel: ObservableObject {
    var fileURLString: String
    
    init(fileURLString: String) {
        self.fileURLString = fileURLString
    }
    
    var pdfDocument: PDFDocument {
        return PDFDocument(url: NSURL(string: fileURLString)! as URL)!
    }
}
