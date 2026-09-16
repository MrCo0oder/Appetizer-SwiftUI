//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by 34ml on 30/08/2026.
//

import Combine
import Foundation
import SwiftUI

struct AccountViewUIState {
    var user: User = User()
    var alertItem: AlertItem?
}
final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var uiState: AccountViewUIState = AccountViewUIState()
    var isValidForm: Bool {
        guard
            !uiState.user.name.isEmpty && !uiState.user.phone.isEmpty
                && !uiState.user.email.isEmpty
        else {
            uiState.alertItem = AlertContext.invalidFormData
            return false
        }
        guard uiState.user.email.isValidEmail else {

            uiState.alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    func saveChanges(hasFeedback: Bool = false) {
        guard isValidForm else { return }
        do {
            let data = try JSONEncoder().encode(uiState.user)
            userData = data
            if !hasFeedback { return }
            uiState.alertItem = AlertContext.dataSaved
        } catch {
            if !hasFeedback { return }
            uiState.alertItem = AlertContext.invalidUserData
        }
    }
    func retriveUser() {
        guard let userData else { return }

        do {
            let data = try JSONDecoder().decode(User.self, from: userData)
            uiState.user = data
        } catch {
            uiState.alertItem = AlertContext.invalidUserData
        }
    }
}
