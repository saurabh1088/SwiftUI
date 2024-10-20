//
//  RadioButtonExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/10/24.
//

import SwiftUI

struct RadioButtonExampleView: View {
    
    private var radioButtonData: [RadioButtonDataModel] = [
        .init(value: "true", label: "True"),
        .init(value: "false", label: "False")
    ]
    
    private var sampleRadioButtonDataLarge: [RadioButtonDataModel] = [
        // Gender options
        RadioButtonDataModel(value: "male", label: "Male"),
        RadioButtonDataModel(value: "female", label: "Female"),
        RadioButtonDataModel(value: "non_binary", label: "Non-Binary"),
        RadioButtonDataModel(value: "prefer_not_to_say", label: "Prefer Not to Say"),
        
        // Payment method options
        RadioButtonDataModel(value: "credit_card", label: "Credit Card"),
        RadioButtonDataModel(value: "debit_card", label: "Debit Card"),
        RadioButtonDataModel(value: "paypal", label: "PayPal"),
        RadioButtonDataModel(value: "apple_pay", label: "Apple Pay"),
        RadioButtonDataModel(value: "google_pay", label: "Google Pay"),
        
        // Subscription plans
        RadioButtonDataModel(value: "free", label: "Free Plan"),
        RadioButtonDataModel(value: "basic", label: "Basic Plan"),
        RadioButtonDataModel(value: "premium", label: "Premium Plan"),
        RadioButtonDataModel(value: "enterprise", label: "Enterprise Plan"),
        
        // Contact preferences
        RadioButtonDataModel(value: "email", label: "Email"),
        RadioButtonDataModel(value: "sms", label: "SMS"),
        RadioButtonDataModel(value: "phone_call", label: "Phone Call"),
        RadioButtonDataModel(value: "in_app", label: "In-App Notification"),
        
        // Feedback options
        RadioButtonDataModel(value: "very_satisfied", label: "Very Satisfied"),
        RadioButtonDataModel(value: "satisfied", label: "Satisfied"),
        RadioButtonDataModel(value: "neutral", label: "Neutral"),
        RadioButtonDataModel(value: "dissatisfied", label: "Dissatisfied"),
        RadioButtonDataModel(value: "very_dissatisfied", label: "Very Dissatisfied")
    ]
        
    
    @State private var selectedSetOne: String = ""
    @State private var selectedSetTwo: String = ""
    
    // Note: Here 150 refers to minimum column width
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            Section("Data Set 1") {
                HStack {
                    RadioButtonForEach(data: radioButtonData, selected: $selectedSetOne)
                }
                Text("Selected: \(selectedSetOne)")
            }
            
            Section("Data Set 2") {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        RadioButtonForEach(data: sampleRadioButtonDataLarge, selected: $selectedSetTwo)
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 300)
                Text("Selected: \(selectedSetTwo)")
            }
        }
    }
}

#Preview {
    RadioButtonExampleView()
}
