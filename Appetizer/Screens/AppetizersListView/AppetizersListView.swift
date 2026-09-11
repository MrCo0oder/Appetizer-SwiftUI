//
//  AppetizersListView.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewmodel = AppetizerListViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                if viewmodel.uiState.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }

                if !viewmodel.uiState.appetizers.isEmpty {
                    List(viewmodel.uiState.appetizers, id: \.id) { item in
                        AppetizerListCell(item: item)
                            .listRowSeparator(Visibility.hidden)
                            .onTapGesture {
                                viewmodel.uiState.selectedAppetizer = item
                                viewmodel.uiState.isDetailsShown = true
                            }
                    }.navigationTitle("Home")
                        .listStyle(.plain)
                        .scrollIndicators(.hidden)
                        .disabled(viewmodel.uiState.isDetailsShown)
                        .blur(radius: viewmodel.uiState.isDetailsShown ? 20 : 0)
                    if viewmodel.uiState.isDetailsShown {
                        AppetizersDetailsView(
                            item: viewmodel.uiState.selectedAppetizer ?? SAMPLE,
                            isShowingDetails: $viewmodel.uiState.isDetailsShown
                        )
                    }
                }
            }

        }.task {
            viewmodel.getAppetizers()
        }
        .alert(item: $viewmodel.uiState.alertItem) { item in
            Alert(
                title: item.title,
                message: item.messsage,
                dismissButton: item.dismissButton
            )
        }
    }

}

#Preview {
    AppetizersListView()
}
