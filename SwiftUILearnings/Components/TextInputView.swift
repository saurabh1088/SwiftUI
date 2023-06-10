//
//
// TextInputView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 09/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct TextInputView: View {
    @State private var name = String()
    @State private var text = String()
    @State private var track = String()
    var body: some View {
        Form {
            textField
            textFieldWithPrompt
            textFieldWithPromptAndLabel
            textEditorView
            textFieldWithAxisVertical
            textFieldWithTrackingChanges
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        TextField("Name", text: $name)
            .padding(16)
            .background(Color.primaryYellow.opacity(0.5))
    }
    
    /// `TextField` when used with prompt will have different behaviour on different platform. For example
    /// on macOS if label and prompt both are provided then prompt will be used as placeholder. On iOS however
    /// label will be used as placeholder if prompt is not provided. Prompt will be used as placeholder if it's provided
    /// on iOS.
    @ViewBuilder
    private var textFieldWithPrompt: some View {
        TextField("Name", text: $name, prompt: Text("Prompt"))
    }
    
    // TODO: This doesn't shows label in iOS, check this on macOS.
    @ViewBuilder
    private var textFieldWithPromptAndLabel: some View {
        TextField(text: $name, prompt: Text("Prompt")) {
            Text("Label")
        }
    }
    
    /// By default when we use `TextField` it's single line. `TextEditor` is the multiline alternative.
    /// However `TextField` can take `axis` as parameter and then start as single line but grows
    /// into multiline once text exceeds. One can also put a line limit to restrict text field height to grow only to
    /// certain level based on number of lines its restricted to, with no restriction in place the height will continue
    /// to grow.
    @ViewBuilder
    private var textFieldWithAxisVertical: some View {
        TextField("Axis", text: $name, axis: .vertical)
    }
    
    @ViewBuilder
    private var textFieldWithTrackingChanges: some View {
        TextField("Track", text: $track)
            .onChange(of: track) { newValue in
                print("Entered value :: \(newValue)")
            }
            .onSubmit {
                print("Final value :: \(track)")
            }
    }
    
    private var textEditorView: some View {
        TextEditor(text: $text)
            .frame(height: 50)
            .padding(16)
            .background(Color.primaryYellow.opacity(0.5))
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
