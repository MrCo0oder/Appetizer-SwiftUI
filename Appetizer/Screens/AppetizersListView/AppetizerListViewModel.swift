//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by 34ml on 16/08/2026.
//

import Combine
import Foundation
import SwiftUI

struct UIState {
    var appetizers: [AppetizerModel] = []
    var isLoading: Bool = false
    var alertItem: AlertItem?
    var isDetailsShown = false
    var selectedAppetizer: AppetizerModel? = nil

}
@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var uiState: UIState = UIState()

    func getAppetizers() {
        uiState.isLoading = true
        self.uiState.alertItem = nil

        Task {
            do {
                self.uiState.appetizers = try await NetworkManager.shared
                    .getAppetizers()
            } catch {
                if let apError = error as? APError {
                    self.uiState.alertItem =
                        switch apError {
                        case .invalidUrl:
                            AlertContext.invalidURL
                        case .invalidResponse:
                            AlertContext.invalidResponse
                        case .invalidData:
                            AlertContext.invalidData
                        case .unableToComplete:
                            AlertContext.unableToComplete
                        }
                } else {
                    self.uiState.alertItem = AlertContext.invalidResponse
                }
            }
            uiState.isLoading = false
        }

    }

}
