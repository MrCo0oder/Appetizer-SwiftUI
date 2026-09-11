//
//  OrdersView.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items, id: \.id) { appetizer in
                            AppetizerListCell(item: appetizer)
                                .listRowSeparator(Visibility.hidden)
                        }
                        .onDelete(perform: deleteItem)

                    }.listStyle(.plain)
                    if !order.items.isEmpty {

                        Button {
                            order.removeAll()
                        } label: {
                            Text(
                                "$\(order.totalPrice,specifier:"%.2f") - Place Order"
                            )
                        }
                        .modifier(StanderdButtonStyle())
                        .padding(.bottom)
                    }
                }
                if order.items.isEmpty {
                    EmtyStateView(
                        img: "empty-order",
                        msg:
                            "You have no items in your order. Please add an appetizer!"
                    )

                }
            }
            .navigationTitle("Orders")
        }
    }
    func deleteItem(at offsets: IndexSet) {
        order.removeItem(at: offsets)
    }
}

#Preview {
    OrdersView().environmentObject(Order())
}
