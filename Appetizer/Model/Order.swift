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
    func removeItem(item: AppetizerModel) {
        items.removeAll { appetizer in
            appetizer.id == item.id
        }
    }
    func removeAll() {
        items.removeAll()
    }
}
