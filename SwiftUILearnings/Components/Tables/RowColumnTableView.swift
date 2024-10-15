//
//  RowColumnTableView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 14/10/24.
//

import SwiftUI

struct Employee: Identifiable {
    let id: Int
    let name: String
    let role: String
    let power: String
    var shouldShowPower: Bool
}

struct RowColumnTableView: View {
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var employees: [Employee] = [
        Employee(id: 0,
                 name: "Batman",
                 role: "Dark Knight",
                 power: "World's Greatest detective",
                 shouldShowPower: true),
        Employee(id: 1,
                 name: "Superman",
                 role: "Man of Steel",
                 power: "Most Powerful Man in the World",
                 shouldShowPower: false),
        Employee(id: 2,
                 name: "Aquaman",
                 role: "King of Atlantis",
                 power: "Swimming is his superpower",
                 shouldShowPower: false)
    ]
    
    var body: some View {
        let binding = Binding(
            get: { self.employees },
            set: { self.employees = $0 }
        )
        
        VStack {
            Table(employees) {
                TableColumn("Name", value: \.name)
                TableColumn("Role", value: \.role)
                TableColumn("Power", value: \.power)
                TableColumn("Test") { employee in
                    Toggle("Should Show", isOn: binding[employee.id].shouldShowPower)
                }
            }
            
            HStack {
                Button("Add Employee") {
                    self.employees.append(Employee(id: self.employees.count,
                                                   name: "Test",
                                                   role: "Test",
                                                   power: "Test",
                                                   shouldShowPower: false))
                }
                
                Button("Show alert") {
                    employees.map { employee in
                        alertMessage = alertMessage + "\(employee.name) " + (employee.shouldShowPower ? "has" : "does not have") + " power"
                    }
                    showAlert.toggle()
                }
                .alert("Alert", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(alertMessage)
                }

            }
            
        }
    }
}

#Preview {
    RowColumnTableView()
}
