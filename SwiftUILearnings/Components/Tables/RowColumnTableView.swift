//
//  RowColumnTableView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 14/10/24.
//

import SwiftUI

struct Employee: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let power: String
}

struct RowColumnTableView: View {
    
    @State private var employees: [Employee] = [
        Employee(name: "Batman", role: "Dark Knight", power: "World's Greatest detective"),
        Employee(name: "Superman", role: "Man of Steel", power: "Most Powerful Man in the World"),
        Employee(name: "Aquaman", role: "King of Atlantis", power: "Swimming is his superpower")
    ]
    
    var body: some View {
        Table(employees) {
            TableColumn("Name", value: \.name)
            TableColumn("Role", value: \.role)
            TableColumn("Power", value: \.power)
            TableColumn("Test") { employee in
                Toggle("Should Show", isOn: .constant(true))
            }
        }
    }
}

#Preview {
    RowColumnTableView()
}
