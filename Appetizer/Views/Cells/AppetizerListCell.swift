//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct AppetizerListCell: View {
    @State var item: AppetizerModel
    var body: some View {
        HStack {
            APRemoteImage(url: item.imageURL)
                .cornerRadius(8)
                .frame(width: 120, height: 90)
                .foregroundStyle(.gray)

            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("$ \(item.price,specifier:"%0.2f")")
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)

            }.padding(.leading)
        }.onTapGesture {

        }
    }
}
