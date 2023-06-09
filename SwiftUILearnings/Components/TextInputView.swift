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
    var body: some View {
        Form {
            textField
            textFieldWithPrompt
            testFieldWithPromptAndLabel
            textEditorView
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
    private var testFieldWithPromptAndLabel: some View {
        TextField(text: $name, prompt: Text("Prompt")) {
            Text("Label")
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
