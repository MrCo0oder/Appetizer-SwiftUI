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
    
    //Mark: - Account Alerts
    
    static let invalidFormData = AlertItem(
        title: Text("Error"),
        messsage: Text("Please enter valid data."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidEmail = AlertItem(
        title: Text("Error"),
        messsage: Text("Please add valid email."),
        dismissButton: .default(Text("OK"))
    )
    static let dataSaved = AlertItem(
        title: Text("Profile Saved"),
        messsage: Text("Your profile info was successfully Saved!"),
        dismissButton: .default(Text("OK"))
    )
    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        messsage: Text("There was an error saving or retriving your profile!"),
        dismissButton: .default(Text("OK"))
    )
}
