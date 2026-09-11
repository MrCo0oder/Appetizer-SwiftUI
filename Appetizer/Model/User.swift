//
//  User.swift
//  Appetizer
//
//  Created by 34ml on 30/08/2026.
//
import Foundation

struct User: Codable {
    var name: String = ""
    var phone: String = ""
    var email: String = ""

    var birthDate: Date = Date()
    var isExtraNapkinsOn: Bool = false
    var isFreqRefillOn: Bool = true
}
