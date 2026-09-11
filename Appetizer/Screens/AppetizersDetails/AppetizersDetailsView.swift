//
//  AppetizersDetailsView.swift
//  Appetizer
//
//  Created by 34ml on 29/08/2026.
//

import SwiftUI

struct AppetizersDetailsView: View {
    @EnvironmentObject var order: Order
    let item: AppetizerModel
    @Binding var isShowingDetails: Bool
    var body: some View {
        ZStack {
            VStack {
                APRemoteImage(url: item.imageURL)
                    .cornerRadius(8)
                    .frame(width: 350, height: 225)
                    .foregroundStyle(.gray)
                VStack {
                    Text(item.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(item.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack(alignment: .center, spacing: 40) {
                        VStack(spacing: 5) {
                            Text("Calories")
                                .bold()
                                .font(.caption)
                            Text("\(item.calories)")
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                        VStack(spacing: 5) {
                            Text("Carb")
                                .bold()
                                .font(.caption)

                            Text("\(item.carbs) g")
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                        VStack(spacing: 5) {

                            Text("Protein")
                                .bold()
                                .font(.caption)
                            Text("\(item.protein) g")
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                    }
                }
                Spacer()
                Button {
                    order.addItem(newItem: item)
                    isShowingDetails = false
                } label: {
                    Text("$\(item.price,specifier:"%.2f") - Add to Orders")
                        .font(.title3)
                        .fontWeight(.semibold)

                }.modifier(StanderdButtonStyle())
                    .padding(.bottom, 30)

            }
            .frame(width: 350, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    isShowingDetails = false
                } label: {
                    Circle()
                        .foregroundStyle(.white)
                        .opacity(0.6)
                        .frame(width: 40, height: 40)
                        .padding()
                        .overlay(Text("X").bold().foregroundStyle(.black))
                }
            }
        }
    }
}

#Preview {
    //    AppetizersDetailsView(item: SAMPLE)
}
