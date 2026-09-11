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
nonisolated struct AppetizersResponse: Decodable {
    let request: [AppetizerModel]
}

let MOCK_DATA = [
    AppetizerModel(
        name: "Dd",
        description: "fdfdfddf",
        protein: 23,
        id: "fdsfdsfds",
        calories: 233,
        price: 2,
        carbs: 122,
        imageURL: "sddsddssdsdsdd"
    ),
    AppetizerModel(
        name: "Dd",
        description: "fdfdfddf",
        protein: 23,
        id: "fdsfs",
        calories: 233,
        price: 2,
        carbs: 122,
        imageURL: "sddsddssdsdsdd"
    ),
]
let SAMPLE = AppetizerModel(
    name: "Dd",
    description: "fdfdfddf",
    protein: 23,
    id: "fdsfdsfds",
    calories: 233,
    price: 2,
    carbs: 122,
    imageURL: "sddsddssdsdsdd"
)
let orderItemOne = AppetizerModel(
    name: "Dd",
    description: "fdfdfddf",
    protein: 23,
    id: "fdsfdsfds",
    calories: 233,
    price: 2,
    carbs: 122,
    imageURL: "sddsddssdsdsdd"
)
