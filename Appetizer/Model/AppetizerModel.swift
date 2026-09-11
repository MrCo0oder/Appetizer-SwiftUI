//
//  AppetizerModel.swift
//  Appetizer
//
//  Created by 34ml on 14/08/2026.
//
import Foundation

 struct AppetizerModel: Decodable {
    let name: String
    let description: String
    let protein: Int
    let id: String
    let calories: Int
    let price: Double
    let carbs: Int
    let imageURL: String
}
nonisolated  struct AppetizersResponse: Decodable {
    let request: [AppetizerModel]
}
