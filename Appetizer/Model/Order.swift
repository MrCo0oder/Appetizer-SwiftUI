import Combine
//
//  Created by 34ml on 14/08/2026.
//
import Foundation
import SwiftUI

final class Order: ObservableObject {
    @Published var items: [AppetizerModel] = []

    func addItem(newItem: AppetizerModel) {
        items.append(newItem)
    }
    func removeItem(at atOffset: IndexSet) {
        items.remove(atOffsets: atOffset)
    }
    func removeAll() {
        items.removeAll()
    }
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
}
