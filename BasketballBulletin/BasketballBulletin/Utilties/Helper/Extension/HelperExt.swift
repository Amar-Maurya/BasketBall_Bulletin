//
//  StringExt.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import Foundation
import SwiftUICore

extension String {
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.date(from: self)
    }
    
    func toMonthYearDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self) ?? .distantPast
    }
}

extension Date {
    func monthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self).uppercased()
    }

    func dayMonthString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM dd"
        return formatter.string(from: self).uppercased()
    }
    
    func timeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self).uppercased()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            _ = scanner.scanString("#")
        }
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
