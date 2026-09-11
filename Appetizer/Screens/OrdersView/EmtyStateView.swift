//
//  EmtyStateView.swift
//  Appetizer
//
//  Created by 34ml on 09/09/2026.
//

import SwiftUI

struct EmtyStateView: View {
    let img: String
    let msg: String
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            VStack {
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                Text(msg)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    EmtyStateView(img: "empty-order", msg: "Hello")
}
