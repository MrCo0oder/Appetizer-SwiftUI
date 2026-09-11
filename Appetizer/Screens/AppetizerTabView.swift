//
//  ContentView.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            AccountView().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            OrdersView().tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }.accentColor(Color.brandColor)
    }
}

#Preview {
    AppetizerTabView()
}
