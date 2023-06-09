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
        VStack {
            textField
            textFieldWithPrompt
            textEditorView
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        TextField("Name", text: $name)
            .padding(16)
            .background(Color.primaryYellow.opacity(0.5))
    }
    
    @ViewBuilder
    private var textFieldWithPrompt: some View {
        TextField("Name", text: $name, prompt: Text("Prompt"))
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
