//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

@main
struct AppetizerApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
