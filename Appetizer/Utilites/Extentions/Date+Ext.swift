//
//  Date+Ext.swift
//  Appetizer
//
//  Created by 34ml on 17/09/2026.
//
import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
