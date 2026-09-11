//
//  StanderdButtonStyle.swift
//  Appetizer
//
//  Created by 34ml on 11/09/2026.
//
import SwiftUI

struct StanderdButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .buttonStyle(.bordered)
            .tint(.brandColor)
            .controlSize(.large)

    }
}
