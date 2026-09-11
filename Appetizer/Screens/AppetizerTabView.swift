//
//  ContentView.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            AppetizersListView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            AccountView().tabItem {
                Label("Account", systemImage: "person")
            }
            OrdersView().tabItem {
                Label("Order", systemImage: "bag")
            }
            .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
