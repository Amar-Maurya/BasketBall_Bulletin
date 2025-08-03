//
//  ViewExt.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//
import SwiftUI

extension View {
    
    func noDataTextStyle(font: Font) -> some View {
        self.matchTextStyle(font: font, color: .gray)
    }
    
    func matchCardStyle(color: Color = .white, radius: CGFloat = 5) -> some View {
        self.background(
            RoundedRectangle(cornerRadius: radius)
                .fill(color)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        )
    }
    
    func matchTextStyle(font: Font = .header12SemiBold, color: Color = .white) -> some View {
        self.font(font)
            .foregroundColor(color)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }

     func verticalDivider(height: CGFloat = 16, color: Color = .white.opacity(0.5)) -> some View {
        Rectangle()
            .frame(width: 1, height: height)
            .foregroundColor(color)
    }

     func matchTitleText(_ text: String) -> some View {
        Text(text)
            .matchTextStyle()
    }
    
    func matchHeavyTitleText(_ text: String, font: Font = .title24Heavy) -> some View {
        Text(text)
            .matchTextStyle(font: font)
    }
    
    func matchHeavyTitleNoDataText(_ text: String, font: Font = .title24Heavy) -> some View {
        Text(text)
            .noDataTextStyle(font: font)
    }
    
    func matchHeavySubTitleText(_ text: String) -> some View {
        Text(text)
            .matchTextStyle(font: .title18Medium)
    }
    
    func mainMatchCardStyle(backgroundColor: Color = .black.opacity(0.8)) -> some View {
        self
            .padding(16)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        backgroundColor,
                        Color.black.opacity(0.8)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
            .padding(.horizontal)
            .padding(.vertical, 8)
    }
}
