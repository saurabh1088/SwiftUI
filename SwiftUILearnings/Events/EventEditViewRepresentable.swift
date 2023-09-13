//
//  EventEditViewRepresentable.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 12/09/23.
//

import EventKitUI
import Foundation
import SwiftUI

struct EventEditViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = EKEventEditViewController
    let eventStore: EKEventStore
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<EventEditViewRepresentable>) -> EKEventEditViewController {
        let ekEventEditViewController = EKEventEditViewController()
        ekEventEditViewController.eventStore = eventStore
        return ekEventEditViewController
    }
    
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: UIViewControllerRepresentableContext<EventEditViewRepresentable>) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, EKEventEditViewDelegate {
        let parent: EventEditViewRepresentable
        
        init(_ parent: EventEditViewRepresentable) {
            self.parent = parent
        }
        
        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            self.parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
