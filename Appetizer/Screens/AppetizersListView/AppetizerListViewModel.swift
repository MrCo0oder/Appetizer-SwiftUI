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
}
final class AppetizerListViewModel: ObservableObject {
    @Published var uiState: UIState = UIState()

    func getAppetizers() {
        uiState.isLoading = true
        self.uiState.alertItem = nil
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.uiState.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.uiState.appetizers = appetizers

                case .failure(let error):
                    self.uiState.alertItem =
                        switch error {
                        case .invalidUrl:
                            AlertContext.invalidURL
                        case .invalidResponse:
                            AlertContext.invalidResponse
                        case .invalidData:
                            AlertContext.invalidData
                        case .unableToComplete:
                            AlertContext.unableToComplete
                        }
                }
            }
        }
    }

}
