//
//  PDFDocumentViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 19/05/24.
//

import Foundation
import PDFKit
import OSLog

// https://sample-videos.com/pdf/Sample-pdf-5mb.pdf
/**
 `PDFDocument` initializer if given a https URL to load PDF from remote service will load the PDF on some
 background queue. Also `PDFDocument` doesn't have any API or way to know when document has successfully
 loaded. There isn't any completion block, or delegate callback or API doesn't supports async/await.
 
 Using as is leads to errors and potential UI freeze.
 
 To solve this issue, the initializer is called on a queue asynchronously. Again as one can't publish any value from
 background thread, hence the actual published property is updated from didSet of pdfDocument property once
 it gets set using dispatch to main queue.
 */
final class PDFDocumentViewModel: ObservableObject {
    var fileURLString: String
    @Published var pdfDocumentDidLoad = false
    var pdfDocument: PDFDocument? {
        didSet {
            Logger.pdf.info("Received PDF Document")
            DispatchQueue.main.async { [self] in
                pdfDocumentDidLoad = true
            }
        }
    }
    private let queue = DispatchQueue.global(qos: .background)
    private let delegate = PDFDocumentViewDelegate()
    
    init(fileURLString: String = "https://sample-videos.com/pdf/Sample-pdf-5mb.pdf") {
        self.fileURLString = fileURLString
    }
    
    func loadPDFDocument() {
        queue.async { [self] in
            Logger.pdf.info("URL for PDF fetch : \(self.fileURLString)")
            Logger.pdf.info("Fetching PDF document...")
            pdfDocument = PDFDocument(url: NSURL(string: fileURLString)! as URL)!
        }
    }
    
    func setDelegate() {
        pdfDocument?.delegate = delegate
    }
}

// TODO: Continue on the search feature.
class PDFDocumentViewDelegate: NSObject, PDFDocumentDelegate {
    func didMatchString(_ instance: PDFSelection) {
        Logger.pdf.info("PDF didMatchString called")
        instance.color = .red
    }
}
