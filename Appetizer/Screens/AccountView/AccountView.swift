//
//  AccountView.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewmodel = AccountViewModel()
    var body: some View {

        NavigationStack {
            Form {
                Section(header: Text("Persoanl Info")) {
                    TextField("Name", text: $viewmodel.uiState.user.name)
                    TextField("Phone", text: $viewmodel.uiState.user.phone)
                        .keyboardType(.numberPad)
                    TextField("Email", text: $viewmodel.uiState.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker(
                        "Birthdate",
                        selection: $viewmodel.uiState.user.birthDate,
                        in: Date().oneHundredYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date
                    )
                    Button {
                        viewmodel.saveChanges(hasFeedback: true)
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("REQUESTS")) {
                    Toggle(
                        "Extra Napkins",
                        isOn: $viewmodel.uiState.user.isExtraNapkinsOn
                    )

                    Toggle(
                        "Frequent Refills",
                        isOn: $viewmodel.uiState.user.isFreqRefillOn
                    )

                }.toggleStyle(SwitchToggleStyle(tint: .brandColor))
                    .foregroundStyle(.brand)

            }.alert(item: $viewmodel.uiState.alertItem) { item in
                Alert(
                    title: item.title,
                    message: item.messsage,
                    dismissButton: item.dismissButton
                )
            }
            .onAppear {
                viewmodel.retriveUser()
            }.onDisappear {
                viewmodel.saveChanges()
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
