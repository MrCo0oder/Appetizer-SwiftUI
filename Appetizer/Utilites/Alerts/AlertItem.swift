//
//  AlertItem.swift
//  Appetizer
//
//  Created by 34ml on 17/08/2026.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let messsage: Text
    let dismissButton: Alert.Button
}
struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Error"),
        messsage: Text("The data receved from server was invalid."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidResponse = AlertItem(
        title: Text("Error"),
        messsage: Text("Invalid response from server."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidURL = AlertItem(
        title: Text("Error"),
        messsage: Text("There was an issue connecting to the server."),
        dismissButton: .default(Text("OK"))
    )
    static let unableToComplete = AlertItem(
        title: Text("Error"),
        messsage: Text("Unable to complete your request at this time."),
        dismissButton: .default(Text("OK"))
    )

}
