//
//  FontExt.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//

import SwiftUI

import SwiftUI

extension Font {
    
    static let title16Heavy = font(size: 16, weight: .heavy)
    static let title24Heavy = font(size: 24, weight: .heavy)
    static let title18Heavy = font(size: 18, weight: .heavy)
    
    static let body16Medium = font(size: 16, weight: .medium)
    static let title18Medium = font(size: 18, weight: .medium)
    
    static let header14Bold = font(size: 14, weight: .bold)
    
    static let header12SemiBold = font(size: 12, weight: .semibold)
    static let title16SemiBold = font(size: 16, weight: .semibold)

    static let body14Regular = font(size: 14, weight: .regular)

    static let caption10Light = font(size: 10, weight: .light)
    
    private static func font(size: CGFloat, weight: Font.Weight) -> Font {
        .system(size: size, weight: weight)
    }
}

